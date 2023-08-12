import sublime
import sublime_plugin
import subprocess
import shlex
import re
from os import path, fstat
from pathlib import Path
from time import time as now
from datetime import datetime
from .utils import *

__author__ = 'Aziz Köksal'
__email__ = 'aziz.koeksal@gmail.com'
__status__ = 'Production'

# TODO: create a plugin test-suite: https://github.com/SublimeText/UnitTesting/

PANEL_NAME = 'output.mix_test'

class FILE_NAMES:
  SETTINGS_JSON = 'mix_test.settings.json'
  REPEAT_JSON = 'mix_test.repeat.json'

class MixTestSettingsCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Opens the `mix test` settings file for the current project.'

  def run(self, **_kwargs):
    abs_file_path = self.window.active_view().file_name()
    mix_settings_path = reverse_find_json_path(self.window, FILE_NAMES.SETTINGS_JSON)

    if mix_settings_path:
      if not path.exists(mix_settings_path):
        save_json_file(mix_settings_path, add_help_info({'args': []}))
      sublime_NewFileFlags_NONE = 4
      self.window.open_file(mix_settings_path, flags=sublime_NewFileFlags_NONE)
    else:
      sublime.message_dialog(COULDNT_FIND_MIX_EXS)

class MixTestCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Runs the full test-suite with `mix test`.'

  def run(self, **_kwargs):
    call_mix_test_with_settings(self.window)

class MixTestFileCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Runs `mix test` on the current test file.'

  def run(self, **_kwargs):
    abs_file_path = self.window.active_view().file_name()
    assert_is_test_file(abs_file_path)
    call_mix_test_with_settings(self.window, abs_file_path=abs_file_path)

  def is_enabled(self):
    return is_test_file(self.window.active_view().file_name())

class MixTestSelectionCommand(sublime_plugin.TextCommand):
  def description(self):
    return 'Runs `mix test` with the currently selected lines.'

  def run(self, _edit):
    abs_file_path = self.view.file_name()
    assert_is_test_file(abs_file_path)

    found_test_header_regions = \
      self.view.find_all(r'(?x) ^ [^\S\n]* (describe|test) [^\S\n]* (?=[\'"] | ~[a-zA-Z])')

    found_test_header_regions = (
        r
        for r in found_test_header_regions
        if self.view.match_selector(
             r.a + len([c for c in self.view.substr(r).rstrip() if c.isspace()]),
             'variable.function.elixir'
           )
      )

    selector_lookup_table = {}

    all_test_block_regions = (
        get_test_block_regions(self.view, header_region, selector_lookup_table)
        for header_region in found_test_header_regions
      )

    all_test_block_regions = [r for r in all_test_block_regions if r]

    intersecting_test_regions = [
        regions
        for selected_lines_region in map(self.view.line, self.view.sel())
        for regions in all_test_block_regions
        if regions[-1].intersects(selected_lines_region)
      ]

    unique_intersecting_test_tuples = \
      unique_items([tuple(r.to_tuple() for r in regions) for regions in intersecting_test_regions])

    intersecting_test_regions = \
      [tuple(sublime.Region(*t) for t in tuples) for tuples in unique_intersecting_test_tuples]

    grouped_by_describe_dict, _ = group_by_describe_block_regions(all_test_block_regions)

    grouped_isecting_by_describe_dict, test_to_describe_dict = \
      group_by_describe_block_regions(intersecting_test_regions)

    exclude_tests_set = set()

    def contains_all_tests(describe_region):
      """ Returns `True` when all tests of a describe-block were selected. """
      all_tests = grouped_by_describe_dict[describe_region.to_tuple()]
      contains_all = all_tests == grouped_isecting_by_describe_dict[describe_region.to_tuple()]
      contains_all = contains_all and len(all_tests) > 1
      contains_all and exclude_tests_set.update(t.to_tuple() for t in all_tests)
      return contains_all

    # Filter out or keep describe-block regions or their contained tests
    # depending on whether all tests were selected or not.
    selected_test_regions = [
        ((header_region, name_region), test_to_describe_dict.get(whole_region.to_tuple()))
        for header_region, name_region, _block_region, whole_region in intersecting_test_regions
        if whole_region.to_tuple() not in exclude_tests_set and (
             whole_region.to_tuple() not in grouped_isecting_by_describe_dict
             or contains_all_tests(whole_region)
           )
      ]

    selected_tests = [
        encode_json_test_name(
            *[self.view.substr(r).strip() for r in header_and_name_regions]
            + [self.view.substr(describe_tuple and describe_tuple[1] or sublime.Region(0))]
          )
        for header_and_name_regions, describe_tuple in selected_test_regions
      ]

    params = {'abs_file_path': abs_file_path, 'names': selected_tests}
    call_mix_test_with_settings(self.view.window(), **params)

  # This function is unused but kept to have a fallback in case
  # the more complicated algorithm doesn't work well enough in the wild.
  def get_selected_tests_by_closest_line_nrs(self, found_test_headers, test_header_line_nrs):
    """ Simpler algorithm which considers only line numbers and no do-end blocks. """
    selected_line_nrs = [self.view.rowcol(region.a)[0] + 1 for region in self.view.sel()]
    test_header_line_nrs = [self.view.rowcol(region.a)[0] + 1 for region in found_test_headers]
    reversed_test_header_line_nrs = list(reversed(list(enumerate(test_header_line_nrs))))

    indexes = (
        next(
          (i for (i, header_line) in reversed_test_header_line_nrs if line_nr >= header_line),
          None
        )
        for line_nr in selected_line_nrs
      )

    test_names = [extract_test_name(self.view, r.b) for r in found_test_headers]
    return [test_names[idx] for idx in sorted(list(set(indexes))) if idx != None]

  def is_enabled(self):
    return is_test_file(self.view.file_name())

class MixTestFailedCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Repeats only tests that failed the last time.'

  def run(self, **_kwargs):
    call_mix_test_with_settings(self.window, failed=True)

class MixTestRepeatCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Repeats `mix test` with the last used parameters.'

  def run(self, **_kwargs):
    json_path = reverse_find_json_path(self.window, path.join('_build', FILE_NAMES.REPEAT_JSON))

    if json_path:
      call_mix_test_with_settings(self.window, **load_json_file(json_path))
    else:
      print_status_msg('Error: No tests to repeat.')

class MixTestSetSeedCommand(sublime_plugin.TextCommand):
  def description(self):
    return 'Sets the seed value with which `mix test` is run.'

  def run(self, _edit, seed=None):
    mix_settings_path = reverse_find_json_path(self.view.window(), FILE_NAMES.SETTINGS_JSON)
    if not mix_settings_path:
      return

    mix_params = load_json_file(mix_settings_path)
    seed = self.view.substr(self.view.sel()[0]) if seed is None else seed
    seed = seed.strip() if type(seed) == str else seed
    msg = None

    if type(seed) == int or seed == '' or type(seed) == str and seed.isdecimal():
      if seed != '':
        msg = 'Mix test seed set to: %d' % int(seed)
        mix_params['seed'] = int(seed)
      else:
        msg = 'Erased mix test seed.'
        'seed' in mix_params and mix_params.pop('seed')

      save_json_file(mix_settings_path, add_help_info(mix_params))

    print_status_msg(msg or 'Error: cannot set mix test seed to: %r' % seed)

  def input(self, _args):
    class SeedInputHandler(sublime_plugin.TextInputHandler):
      def placeholder(self): return 'Enter a number or leave empty to erase.'
      def validate(self, text): return text.strip().isdecimal() or text == ''

    is_decimal = self.view.substr(self.view.sel()[0]).strip().isdecimal()
    return SeedInputHandler() if not is_decimal else None

class MixTestToggleStaleFlagCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Toggles the --stale flag.'

  def run(self, **_kwargs):
    mix_settings_path = reverse_find_json_path(self.window, FILE_NAMES.SETTINGS_JSON)
    if not mix_settings_path:
      return
    mix_params = load_json_file(mix_settings_path)
    args = mix_params.get('args', [])
    has_stale_flag = '--stale' in args
    args = [a for a in args if a != '--stale'] if has_stale_flag else args + ['--stale']
    mix_params['args'] = args
    save_json_file(mix_settings_path, mix_params)
    print_status_msg('%s mix test --stale flag!' % ['Added', 'Removed'][has_stale_flag])

class MixTestSwitchToCodeOrTestCommand(sublime_plugin.TextCommand):
  def description(self):
    return 'Finds the corresponding source file of the test and vice versa if possible.'

  def run(self, _edit):
    window = self.view.window()
    file_path = Path(self.view.file_name())
    parts = file_path.name.rsplit('_test.exs', 1)
    is_test = parts[1:] == ['']
    search_names = \
      [parts[0] + ext for ext in ('.ex', '.exs')] if is_test else [file_path.stem + '_test.exs']
    ignored_folders = ['.elixir_ls', '_build', 'deps']

    subpaths = [
        p
        for folder in (window.folders() or [reverse_find_root_folder(file_path)]) if folder
        for p in Path(folder).iterdir()
        if p.is_file() or p.name not in ignored_folders
      ]

    counterpart_paths = [
        (subpath, p)
        for subpath in subpaths
        for p in (subpath.rglob("*.ex*") if subpath.is_dir() else [subpath])
        if p.name in search_names
      ]

    if len(counterpart_paths) > 1:
      on_select = lambda i: i >= 0 and window.open_file(str(counterpart_paths[i][1]))

      file_path_items = [
          sublime.QuickPanelItem(
              trigger=str(path.relative_to(folder)),
              details='Folder: %s' % folder,
              kind=sublime.KIND_NAVIGATION
            )
          for folder, path in counterpart_paths
        ]

      window.show_quick_panel(file_path_items, on_select)
    elif counterpart_paths:
      window.open_file(str(counterpart_paths[0][1]))
    else:
      test_or_code = ['test', 'code'][is_test]
      print_status_msg('Error: could not find the counterpart %s file.' % test_or_code)

  def is_enabled(self):
    return is_elixir_syntax(self.view)

class MixTestShowPanelCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Shows the output panel if existent and hidden.'

  def run(self, **_kwargs):
    self.window.run_command('show_panel', {'panel': PANEL_NAME})

  def is_enabled(self):
    return PANEL_NAME != self.window.active_panel() and PANEL_NAME in self.window.panels()

class MixTestHidePanelCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Hides the output panel if visible.'

  def run(self, **_kwargs):
    self.window.run_command('hide_panel', {'panel': PANEL_NAME})

  def is_enabled(self):
    return PANEL_NAME == self.window.active_panel()


# Helper functions:
##

def is_test_file(file_path): return (file_path or '').endswith('_test.exs')

def assert_is_test_file(file_path):
  if not is_test_file(file_path):
    msg = 'Not an Elixir test file! Its name must end with "*_test.exs"!'
    print_status_msg(msg)
    raise Exception(msg)

def extract_test_name(view, test_name_begin_point):
  return view.substr(expand_scope_right(view, test_name_begin_point, 'meta.string.elixir'))

def get_test_block_regions(view, header_region, lookup_table):
  """ Returns the test's header, name, do-block and complete region, or `None` otherwise. """
  name_region = expand_scope_right(view, header_region.b, 'meta.string.elixir')
  point, view_size = name_region.b, view.size()
  begin_scopes_counter = 0

  # TODO: use view.expand_to_scope() when available?

  while point < view_size:
    token_region = view.extract_scope(point)
    token_str = view.substr(token_region)
    scope_names = view.scope_name(point)

    if begin_scopes_counter == 0 and token_str in ('do', 'do:'):
      meta_block_elixir_scopes = ['meta.block.elixir'] * scope_names.count('meta.block.elixir')

      meta_scopes = ' '.join(meta_block_elixir_scopes + (
          [] if token_str == 'do' else ['meta.function-call.arguments.elixir']
        ))

      block_regions = lookup_table.setdefault(
          meta_scopes,
          meta_scopes in lookup_table or view.find_by_selector(meta_scopes)
        )

      do_block_region = next((r for r in block_regions if r.contains(point)), None)

      if do_block_region:
        complete_region = sublime.Region(header_region.a, do_block_region.b)
        return (header_region, name_region, do_block_region, complete_region)

    # Keep track of opening and closing tokens in order to skip unwanted do-blocks:
    is_begin_scope = '.begin.elixir' in scope_names

    if token_str not in ': % # ' and (is_begin_scope or '.end.elixir' in scope_names):
      point += len(token_str) - 1
      begin_scopes_counter += 1 if is_begin_scope else -1

    point += 1

def group_by_describe_block_regions(test_block_regions):
  """
  Returns a dict mapping a describe-block to its tests
  and a dict mapping a test to its describe-block.
  """
  grouped_by_describe_dict = {}
  test_to_describe_dict = {}
  parent_describe = None
  group_stack = []

  def maybe_put_group_stack():
    nonlocal group_stack
    if group_stack:
      grouped_by_describe_dict[parent_describe[-1].to_tuple()] = group_stack
      group_stack = []

  for regions in test_block_regions:
    whole_region = regions[-1]

    if parent_describe and parent_describe[-1].contains(whole_region):
      test_to_describe_dict[whole_region.to_tuple()] = parent_describe
      group_stack.append(whole_region)
    else:
      maybe_put_group_stack()
      parent_describe = regions

  maybe_put_group_stack()

  return (grouped_by_describe_dict, test_to_describe_dict)

def encode_json_test_name(type, name, describe_name):
  parent_describe = '%s %s\0' % ('describe', describe_name) if describe_name else ''
  return parent_describe + '%s %s' % (type, name)

def decode_json_test_name(type_names):
  parts = [type_name.split(' ', 1) for type_name in type_names.split('\0', 1)]
  return parts if len(parts) == 2 else [[None, None]] + parts

def find_lines_using_test_names(file_path, test_names):
  """ Scans a text file and returns located as well as unlocated tests. """
  original_file_text, pruned_text = '', ''
  with open(file_path, 'r') as file: original_file_text = file.read()

  located_tests, unlocated_tests = [], []

  # This regex relies on the code being indented/formatted properly.
  describe_block_rx = re.compile(
      r'(?x) ^ ([^\S\n]*) describe [^\S\n]* (?:[\'"] | ~[a-zA-Z]) [\s\S]+?'
      + r'\bdo\b (?![?!:]) [\s\S]*? \n \1 \bend\b (?![?!:])',
      re.MULTILINE
    )

  for [[has_parent, parent_describe_name], [type, name]] \
      in map(decode_json_test_name, test_names):
    modified_file_text = original_file_text
    previous_newlines = 0

    # Different describe-blocks may contain tests with the same name.
    # Need to first skip to the parent describe-block and search from there.
    if has_parent:
      rx = r'(?x) ^ [^\S\n]* %s [^\S\n]* %s' % ('describe', re.escape(parent_describe_name))
      match = re.search(rx, original_file_text, re.MULTILINE)

      if match:
        modified_file_text = original_file_text[match.start() : ]
        previous_newlines = original_file_text[0 : match.start()].count('\n')
      else:
        unlocated_tests.append((parent_describe_name, type, name))
        continue
    elif type == 'test':
      # Avoid possibly matching a test with the same name inside a do-block.
      if not pruned_text:
        replacer = lambda s: '\n' * s.group().count('\n')
        pruned_text = re.sub(describe_block_rx, replacer, original_file_text)

      modified_file_text = pruned_text

    rx = r'(?x) ^ [^\S\n]* %s [^\S\n]* %s' % (type, re.escape(name))
    match = re.search(rx, modified_file_text, re.MULTILINE)

    if match:
      line_number = modified_file_text[0 : match.start()].count('\n') + previous_newlines + 1
      located_tests.append((type, name, line_number))
    else:
      unlocated_tests.append((parent_describe_name, type, name))

  return (located_tests, unlocated_tests)

def reverse_find_json_path(window, json_file_path):
  """ Tries to find the given JSON file by going up the folder tree
      and trying different starting locations. """
  paths = [window.active_view().file_name()] + window.folders()
  root_dir = next((reverse_find_root_folder(p) for p in paths if p), None)

  root_dir or print_status_msg(COULDNT_FIND_MIX_EXS)

  return root_dir and path.join(root_dir, json_file_path) or None

def call_mix_test_with_settings(window, **params):
  """ Calls `mix test` with the settings JSON merged with the given params. """
  mix_settings_path = reverse_find_json_path(window, FILE_NAMES.SETTINGS_JSON)

  if not mix_settings_path:
    return

  root_dir = path.dirname(mix_settings_path)
  build_dir = path.join(root_dir, '_build')

  if 'abs_file_path' in params:
    params.setdefault('file_path', path.relpath(params['abs_file_path'], root_dir))
    del params['abs_file_path']

  save_json_file(path.join(build_dir, FILE_NAMES.REPEAT_JSON), params)

  mix_params = load_json_file(mix_settings_path)
  mix_params = remove_help_info(mix_params)
  mix_params.update(params)
  mix_params.setdefault('cwd', root_dir)

  call_mix_test(window, mix_params, root_dir)

def call_mix_test(window, mix_params, cwd):
  """ Calls `mix test` in an asynchronous thread. """
  cmd, file_path, names, seed, failed, args = \
    list(map(mix_params.get, ('cmd', 'file_path', 'names', 'seed', 'failed', 'args')))

  located_tests, unlocated_tests = \
    names and find_lines_using_test_names(path.join(cwd, file_path), names) or (None, None)

  if unlocated_tests:
    mix_params['unlocated_tests'] = unlocated_tests

  if file_path and located_tests:
    file_path += ''.join(':%s' % l for (_t, _n, l) in located_tests)

  mix_test_pckg_settings = sublime.load_settings(SETTINGS_FILE_NAME).get('mix_test', {})

  def get_setting(key):
    return next((s.get(key) for s in [mix_params, mix_test_pckg_settings] if key in s), None)

  cmd = get_setting('cmd')
  args = get_setting('args')
  seed = get_setting('seed')

  seed_arg = ['--seed', str(seed)] if seed is not None else []
  file_path_arg = file_path and [file_path] or []
  cmd_arg = cmd or ['mix', 'test']
  failed_arg = failed and ['--failed'] or []
  mix_command = cmd_arg + seed_arg + file_path_arg + (args or []) + failed_arg
  print(PRINT_PREFIX, '`%s` parameters:' % ' '.join(cmd_arg), mix_params)

  sublime.set_timeout_async(
      lambda: write_to_output(window, mix_command, mix_params, cwd, get_setting)
    )

def write_to_output(window, cmd_args, params, cwd, get_setting):
  """ Creates the output view/file and runs the `mix test` process. """
  mix_test_output = get_setting('output') or 'panel'
  output_scroll_time = get_setting('output_scroll_time')
  output_scroll_time = output_scroll_time if type(output_scroll_time) == int else None
  output_view = output_file = None

  if type(mix_test_output) != str:
    msg = 'Error: "output" setting is not of type string, but: %r'
    print_status_msg(msg % type(mix_test_output))
  elif mix_test_output == 'tab':
    output_view = window.new_file()
    output_view.set_scratch(True)
  elif mix_test_output == 'panel':
    output_view = window.create_output_panel('mix_test')
    window.run_command('show_panel', {'panel': PANEL_NAME})
  elif mix_test_output.startswith('file://'):
    mode = get_setting('output_mode') or 'w'
    output_path = Path(mix_test_output[len('file://'):])
    output_path = str(
        output_path.is_absolute() and output_path
        or (window.folders() + [cwd])[0] / output_path
      )

    try:
      output_file = open(output_path, mode)
    except (PermissionError, FileNotFoundError, IsADirectoryError) as e:
      msg = 'Error: could not open output file %r with mode %r (%s)'
      print_status_msg(msg % (output_path, mode, e))

  if not (output_view or output_file):
    msg = 'Error: cannot run `mix test`. No valid output setting ("output": %r).'
    print_status_msg(msg % mix_test_output)
    return

  if output_view:
    active_view_settings = window.active_view().settings()
    # output_view.assign_syntax('Packages/X/Y.sublime-syntax')
    file_path = params.get('file_path')
    output_view.retarget('%s.log' % (file_path and path.join(cwd, file_path)))
    output_view.set_name('mix test' + (file_path and ' ' + file_path or ''))
    ov_settings = output_view.settings()
    ov_settings.set('word_wrap', active_view_settings.get('word_wrap'))
    ov_settings.set('result_file_regex', r'^\s+(.+?):(\d+)$')
    # ov_settings.set('result_line_regex', r'^:(\d+)')
    ov_settings.set('result_base_dir', cwd)
    output_view.set_read_only(False)

  def write_output(txt):
    if output_file:
      output_file.write(txt)
    else:
      output_view.run_command('append', {'characters': txt, 'disable_tab_translation': True})

  if params.get('unlocated_tests'):
    write_output(
        'Error: could not find previously selected tests:\n%s\n\n' % '\n'.join(
          '  %d. %s%s %s' % (i + 1, d and 'describe %s -> ' % d or '', t, name.replace('\n', '\\n'))
          for i, (d, t, name) in enumerate(params.get('unlocated_tests'))
        )
        + 'File: %s\n\n' % path.join(cwd, params.get('file_path'))
        + 'This error occurs when:\n'
        + '* a test\'s name has been changed, or\n'
        + '* the test file has unsaved changes.\n\n'
        + 'Reselect the tests to be run or edit _build/%s to fix the name(s).\n'
          % FILE_NAMES.REPEAT_JSON
      )
    return

  proc = subprocess.Popen(cmd_args, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

  if output_view:
    output_view.settings().set('view_id', output_view.id())

  cmd = ' '.join(params.get('cmd') or ['mix test'])
  first_lines = '$ cd %s && %s' % (shlex.quote(cwd), ' '.join(map(shlex.quote, cmd_args)))
  first_lines += '\n# `%s` pid: %s' % (cmd, proc.pid)
  first_lines += '\n# Timestamp: %s' % datetime.now().replace(microsecond=0)
  if params.get('names'):
    first_lines += '\n# Selected tests:\n%s' % '\n'.join(
        '#   %d. %s' % (i + 1, n.replace('\0', ' -> ').replace('\n', '\\n'))
        for i, n in enumerate(params.get('names'))
      )

  print(PRINT_PREFIX + ''.join('\n' + (line and '  ' + line) for line in first_lines.split('\n')))
  write_output(first_lines + '\n\n')

  past_time = now()

  while proc.poll() is None:
    if output_file and fstat(output_file.fileno()).st_nlink == 0 \
       or output_view and not output_view.window():
      on_output_close(proc, cmd)
      break

    try:
      write_output(proc.stdout.readline().decode(encoding='UTF-8'))

      if output_scroll_time != None and now() - past_time > output_scroll_time:
        if output_file:
          output_file.flush()
        else:
          output_view.show(output_view.size())
        past_time = now()
    except:
      break

  if output_file:
    output_file.close()
  else:
    output_view.set_read_only(True)
    output_scroll_time != None and output_view.show(output_view.size())

def on_output_close(proc, cmd):
  if proc.poll() is None:
    can_stop = sublime.ok_cancel_dialog(
        'The `%s` process is still running. Stop the process?' % cmd,
        ok_title='Yes', title='Stop running `%s`' % cmd
      )

    if can_stop:
      print_status_msg('Stopping `%s` (pid=%s).' % (cmd, proc.pid))
      proc.send_signal(subprocess.signal.SIGQUIT)

def add_help_info(dict_data):
  dict_data['help'] = {
      '': 'To configure a setting add the key to the root JSON object.',
      'output': {'description': 'Choose where to display the command\'s output.', 'default': 'panel', 'values': ['tab', 'panel', 'file://...']},
      'output_mode': {'description': 'Output mode of the disk file to open/create.', 'default': 'w', 'values': 'see `open()` modifiers'},
      'cmd': {'description': 'Which command to execute.', 'default': ['mix', 'test']},
      'args': {'description': 'Additional arguments to pass to `cmd`.', 'default': [], 'values': 'see `mix help test`'},
      'output_scroll_time': {'description': 'Automatically scroll the output view every t seconds. `null` disables scrolling.', 'default': 2, 'values': [None, 'non-negative float']},
      'seed': {'description': 'The seed with which to randomize the tests.', 'default': None, 'values': [None, 'non-negative integer']},
    }
  return dict_data

def remove_help_info(dict_data):
  'help' in dict_data and dict_data.pop('help')
  return dict_data
