import sublime
import sublime_plugin
import subprocess
import shlex
from .utils import *
from time import time as now
from datetime import datetime

__author__ = 'Aziz Köksal'
__email__ = 'aziz.koeksal@gmail.com'
__status__ = 'Production'

class MixFormatProjectCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Runs `mix format` on the project path or the opened folder.'

  def run(self, **_kwargs):
    call_mix_format_async(self.window)

class MixFormatFileCommand(sublime_plugin.TextCommand):
  def description(self):
    return 'Runs `mix format` on the current file.'

  def run(self, _edit, **kwargs):
    window = self.view.window()
    file_path = self.view.file_name()
    kwargs.get('save', True) and window.run_command('save')
    call_mix_format_async(window, file_path=file_path)

  def is_enabled(self):
    return is_formattable_syntax(self.view)

class MixFormatToggleAutoFormatCommand(sublime_plugin.TextCommand):
  def description(self):
    return 'Enables or disables auto-formatting on save.'

  def run(self, _edit, **_kwargs):
    package_settings, mix_format_settings = load_mix_format_settings()
    on_save = mix_format_settings['on_save'] = not mix_format_settings.get('on_save', False)
    package_settings.set('mix_format', mix_format_settings)
    sublime.save_settings(SETTINGS_FILE_NAME)
    print_status_msg('%s auto-formatting!' % ['Disabled', 'Enabled'][on_save])

  def is_enabled(self):
    return is_formattable_syntax(self.view)

class MixFormatOnSaveListener(sublime_plugin.EventListener):
  def is_elixir_file(self, view):
    return is_formattable_syntax(view)

  def on_post_save(self, view):
    if not self.is_elixir_file(view):
      return
    _, mix_format_settings = load_mix_format_settings()
    if mix_format_settings.get('on_save', False):
      MixFormatFileCommand(view).run(None, save=False)
    if mix_format_settings.get('reload_after', False):
      view.run_command('revert')

def load_mix_format_settings():
  package_settings = sublime.load_settings(SETTINGS_FILE_NAME)
  return (package_settings, package_settings.get('mix_format', {}))

def call_mix_format_async(window, **kwargs):
  file_path = kwargs.get('file_path')
  print_status_msg('Formatting %s!' % (file_path and repr(file_path) or 'project'))
  sublime.set_timeout_async(lambda: call_mix_format(window, **kwargs))

def call_mix_format(window, **kwargs):
  file_path = kwargs.get('file_path')
  file_path_list = file_path and [file_path] or []
  _, cmd_setting = load_mix_format_settings()
  cmd_args = (cmd_setting.get('cmd') or ['mix', 'format']) + file_path_list

  paths = file_path_list + window.folders()
  cwd = next((reverse_find_root_folder(p) for p in paths if p), None)

  if not (cwd or file_path):
    print_status_msg(COULDNT_FIND_MIX_EXS)
    return

  proc = subprocess.Popen(cmd_args, cwd=cwd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT, bufsize=0)

  panel_name = 'mix_format'
  panel_params = {'panel': 'output.%s' % panel_name}
  window.run_command('erase_view', panel_params)
  output_view = None

  past_timestamp = now()
  panel_update_interval = 2

  try:
    for text in read_proc_text_output(proc):
      if not output_view:
        # Only open the panel when mix is compiling or there is an error.
        output_view = create_mix_format_panel(window, panel_name, cmd_args, cwd)
        window.run_command('show_panel', panel_params)

      output_view.run_command('append', {'characters': text, 'disable_tab_translation': True})

      if now() - past_timestamp > panel_update_interval:
        output_view.show(output_view.size())
        past_timestamp = now()
  except BaseException as e:
    write_output(PRINT_PREFIX + " Exception: %s" % repr(e))

  if output_view:
    output_view.set_read_only(True)
  else:
    if window.active_panel() == panel_params['panel']:
      window.run_command('hide_panel', panel_params)
      window.destroy_output_panel(panel_name)

    msg = 'Formatted %s %s!' % (file_path and 'file' or 'directory', repr(file_path or cwd))
    print_status_msg(msg)

def create_mix_format_panel(window, panel_name, cmd_args, cwd):
  first_lines = '$ cd %s && %s' % (shlex.quote(cwd), ' '.join(map(shlex.quote, cmd_args)))
  first_lines += '\n# Timestamp: %s\n\n' % datetime.now().replace(microsecond=0)

  output_view = window.create_output_panel(panel_name)
  output_view.settings().set('result_file_regex', MIX_RESULT_FILE_REGEX)
  output_view.settings().set('result_base_dir', cwd)
  output_view.set_read_only(False)
  output_view.run_command('append', {'characters': first_lines})
  output_view.run_command('move_to', {'to': 'eof'})

  return output_view
