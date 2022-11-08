import sublime
import sublime_plugin
import subprocess
import shlex
from .utils import *

__author__ = 'Aziz Köksal'
__email__ = 'aziz.koeksal@gmail.com'
__status__ = 'Production'

class MixFormatProjectCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Runs `mix format` on the project path or the opened folder.'

  def run(self, **_kwargs):
    call_mix_format(self.window)

class MixFormatFileCommand(sublime_plugin.TextCommand):
  def description(self):
    return 'Runs `mix format` on the current file.'

  def run(self, _edit, **kwargs):
    window = self.view.window()
    file_path = self.view.file_name()
    kwargs.get('save', True) and window.run_command('save')
    call_mix_format(window, file_path=file_path)

  def is_enabled(self):
    return is_elixir_syntax(self.view)

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
    return is_elixir_syntax(self.view)

class MixFormatOnSaveListener(sublime_plugin.EventListener):
  def is_elixir_file(self, view):
    return is_elixir_syntax(view)

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

def call_mix_format(window, **kwargs):
  file_path = kwargs.get('file_path')
  file_path_list = file_path and [file_path] or []
  _, cmd_setting = load_mix_format_settings()
  cmd = (cmd_setting.get('cmd') or ['mix', 'format']) + file_path_list

  paths = file_path_list + window.folders()
  cwd = next((reverse_find_root_folder(p) for p in paths if p), None)

  if not (cwd or file_path):
    print_status_msg(
        'Error: could not find a mix.exs file and the _build/ directory! '
        + 'Make sure that you are in a mix project and that `mix deps.get` was run.'
      )
    return

  proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=cwd)
  stderr_data = proc.communicate()[1]

  panel_name = 'mix_format'
  panel_params = {'panel': 'output.%s' % panel_name}
  window.run_command('erase_view', panel_params)

  if stderr_data.strip():
    first_lines = '$ %s\n\n' % ' '.join(map(shlex.quote, cmd))
    output_view = window.create_output_panel(panel_name)
    ov_settings = output_view.settings()
    ov_settings.set('result_file_regex', r'/([^/]+):(\d+):(\d+)')
    output_view.set_read_only(False)
    output_view.run_command('append', {'characters': first_lines})
    output_view.run_command('append', {'characters': stderr_data.decode()})
    output_view.set_read_only(True)
    window.run_command('show_panel', panel_params)
  else:
    # FIXME: closes any panel...
    # window.run_command('hide_panel', panel_params)
    print_status_msg(
        'Formatted %s %s!' % (file_path and 'file' or 'directory', repr(file_path or cwd))
      )
