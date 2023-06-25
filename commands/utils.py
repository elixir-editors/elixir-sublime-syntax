import sublime
import json
from pathlib import Path

__author__ = 'Aziz Köksal'
__email__ = 'aziz.koeksal@gmail.com'
__status__ = 'Production'

SETTINGS_FILE_NAME = 'ElixirSyntax.sublime-settings'

PRINT_PREFIX = 'ElixirSyntax:'

COULDNT_FIND_MIX_EXS = \
  'Error: could not find a mix.exs file and the _build/ directory!\n' + \
    'Make sure that you are in a mix project and that `mix \'do\' deps.get, compile` has been run.'

def print_status_msg(msg):
  print(PRINT_PREFIX, msg)
  sublime.status_message(PRINT_PREFIX + ' ' + msg)

def expand_scope_right(view, begin_point, scope):
  end_point = next(
    (pt for pt in range(begin_point, view.size()) if not view.match_selector(pt, scope)),
    begin_point
  )
  return sublime.Region(begin_point, end_point)

def has_one_of_scope_suffixes(view, scope_suffixes):
  view_scope_suffixes = view.scope_name(0).split(' ')[0].split('.')[1:]
  return any(suffix in view_scope_suffixes for suffix in scope_suffixes)

def is_elixir_syntax(view):
  return has_one_of_scope_suffixes(view, ['elixir'])

def is_formattable_syntax(view):
  return has_one_of_scope_suffixes(view, ['elixir', 'eex', 'heex', 'surface'])

def reverse_find_root_folder(bottom_path):
  bottom_path = Path(bottom_path)
  parent_path = bottom_path.parent if bottom_path.is_file() else bottom_path

  while True:
    if all((parent_path / p).exists() for p in ['mix.exs', '_build']):
      return str(parent_path)
    old_path, parent_path = parent_path, parent_path.parent
    if old_path == parent_path:
      break

  return None

def save_json_file(file_path, dict_data):
  try:
    with open(str(file_path), 'w') as file:
      try:
        return json.dump(dict_data, file, indent=2)
      except BaseException as e:
        print_status_msg('Error: could not save JSON to: %r\nException: %s' % (file_path, e))
  except BaseException as e:
    print_status_msg('Error: could not open file: %r\nException: %s' % (file_path, e))

def load_json_file(file_path):
  try:
    with open(str(file_path), 'r') as file:
      try:
        return json.load(file)
      except BaseException as e:
        print_status_msg('Error: could not load JSON from: %r\nException: %s' % (file_path, e))
  except BaseException as e:
    exists = Path(file_path).exists()
    exists and print_status_msg('Error: could not open file: %r\nException: %s' % (file_path, e))

  return {}
