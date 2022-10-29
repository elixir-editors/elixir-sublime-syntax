import sublime
import sublime_plugin
import re
import webbrowser

from pathlib import Path
from urllib import request
from urllib.error import HTTPError
from datetime import datetime
from .utils import *

__author__ = 'Aziz Köksal'
__email__ = 'aziz.koeksal@gmail.com'
__status__ = 'Production'

HEXDOCS_URL = 'https://hexdocs.pm'
HEX_URL = 'https://hex.pm'
ELIXIR_CORE_APP_NAMES = ['eex', 'elixir', 'ex_unit', 'hex', 'iex', 'logger', 'mix']
name_lastmod_rx = r'hexdocs.pm/([^/]+)/[\s\S]+?<lastmod>([^<]+)</lastmod>'
PROJECT_MAX_AGE_DAYS = 365

class SearchHexPackagesCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Searches hex.pm and shows the results.'

  def run(self, **kwargs):
    query = (kwargs.get('query') or '').strip()

    if query:
      print_status_msg('Searching hex.pm for %r' % query)
      sublime.set_timeout_async(lambda: search_hex_pm(self.window, query))

  def input(self, _args):
    class QueryInputHandler(sublime_plugin.TextInputHandler):
      def placeholder(self): return 'Search hex.pm'
      def validate(self, text): return text.strip() != ''

    return QueryInputHandler()

class OpenHexDocsCommand(sublime_plugin.WindowCommand):
  def description(self):
    return 'Finds and opens hex documentation in the browser.'

  def run(self, **_kwargs):
    cache_dir = Path(sublime.cache_path(), 'ElixirSyntax')
    cache_dir.exists() or cache_dir.mkdir(parents=True)

    cached_sitemap_json_path = Path(cache_dir, 'hexdocs.sitemap.json')

    sitemap_dict = {}
    sitemap_url = HEXDOCS_URL + '/sitemap.xml'

    if cached_sitemap_json_path.exists():
      sitemap_dict = load_json_file(cached_sitemap_json_path)
      etag = sitemap_dict['etag']

      def refresh_sitemap():
        try:
          resp = request.urlopen(request.Request(sitemap_url, headers={'If-None-Match': etag}))
          sitemap_dict = fetch_parse_and_save_sitemap(resp, cached_sitemap_json_path)
          show_hexdocs_list(self.window, sitemap_dict.get('projects', []))
        except HTTPError as e:
          e.code == 304 or print_status_msg('Error: %s' % e)

      sublime.set_timeout_async(refresh_sitemap)

      show_hexdocs_list(self.window, sitemap_dict.get('projects', []))
    else:
      print_status_msg('Downloading %r' % sitemap_url)

      def fetch_sitemap():
        try:
          resp = request.urlopen(sitemap_url)
          sitemap_dict = fetch_parse_and_save_sitemap(resp, cached_sitemap_json_path)
          show_hexdocs_list(self.window, sitemap_dict.get('projects', []))
        except HTTPError as e:
          print_status_msg('Error: could not fetch %r (status=#%s)' % (sitemap_url, resp.code))

      sublime.set_timeout_async(fetch_sitemap)

def search_hex_pm(window, query, **kwargs):
  """ Searches hex.pm and shows the results in a quick panel overlay. """
  page = kwargs.get('page')
  page_param = page and ['page=%s' % page] or []
  query = query and ''.join('%%%x' % ord(c) if c in '#&/?' else c for c in query)
  get_params = '&'.join(['search=%s' % query, 'sort=recent_downloads'] + page_param)
  query_url = HEX_URL + '/packages?' + get_params
  resp = request.urlopen(query_url)
  results_html = resp.read().decode('utf-8')

  package_list_match = re.search(r'<div class="package-list">([\s\S]+?)\n</div>', results_html)
  page_match = re.search(r'<li class="active">[\s\S]+?</li>[\s\S]+?\bpage=(\d+)', results_html)
  next_page = page_match and int(page_match.group(1))
  total_count_match = re.search(r'packages of (\d+) total', results_html)
  total_packages_count = total_count_match and total_count_match.group(1)

  if not package_list_match:
    has_no_results = 'no-results' in results_html

    msg = [
        'could not find div.package-list in the results HTML.',
        'no results found for %r on hex.pm!' % query
      ][has_no_results]

    if has_no_results:
      overlay_args = {'overlay': 'command_palette', 'command': 'search_hex_packages'}
      window.run_command('show_overlay', overlay_args)
      window.run_command('insert', {'characters': query})

    print_status_msg('Error: ' + msg)
    return

  package_matches = re.findall(r'''(?xi)
      <span\sclass="download-count"> (.+?) </span> [\s\S]*?
      <span.+?> total\sdownloads:\s (.+?) </span> [\s\S]*?
      <a.+?> (.+?) </a> [\s\S]*?
      <span.+?> (.+?) </span> [\s\S]*?
      <p> ([^<]*) </p>
      ''',
      package_list_match.group(1)
    )

  previous_results = kwargs.get('previous_results') or []

  results = previous_results + [
      {'name': m[2], 'desc': m[4], 'version': m[3], 'recent_dls': m[0], 'total_dls': m[1],
       'url': HEX_URL + '/packages/' + m[2]}
      for m in package_matches
    ]

  selectable_results = results + [
      {'label': 'Open search query in browser', 'url': query_url, 'desc': 'Terms: %s' % query},
    ] + (
      next_page and [{
        'label': 'Load page %d' % next_page,
        'page': next_page,
        'desc': 'Total packages found: %s' % (total_packages_count or 'unknown')
      }] or []
    )

  def on_select(i):
    if i >= 0:
      result = selectable_results[i]
      if result.get('page'):
        print_status_msg('Loading page %d on hex.pm for %r' % (next_page, query))
        cb = lambda: search_hex_pm(window, query, page=next_page, previous_results=results)
        sublime.set_timeout_async(cb)
      else:
        webbrowser.open_new_tab(result['url'])

  placeholder = 'Open a project in the web browser.'
  selected_index = len(previous_results) if previous_results else -1

  result_items = [
      sublime.QuickPanelItem(
          trigger=result.get('label') or '%s v%s' % (result['name'], result['version']),
          details=result.get('desc') or '',
          annotation=result.get('recent_dls') \
            and '%s recent / %s total downloads' % (result['recent_dls'], result['total_dls']) \
            or '',
          kind=result.get('recent_dls') and sublime.KIND_NAVIGATION or sublime.KIND_AMBIGUOUS
        )
      for result in selectable_results
    ]

  window.show_quick_panel(result_items, on_select,
      placeholder=placeholder, selected_index=selected_index
    )

def fetch_parse_and_save_sitemap(resp, cached_sitemap_json_path):
  """ Fetches, parses and saves the sitemap items in a JSON file. """
  etag = next(
      (value for (header, value) in resp.headers.items() if header.lower() == 'etag'), None
    )

  sitemap_xml = resp.read().decode('utf-8')
  elixir_core_projects = [(name, None) for name in ELIXIR_CORE_APP_NAMES]
  hexdocs_projects = re.findall(name_lastmod_rx, sitemap_xml)
  young_projects, old_projects, now = [], [], datetime.now()

  for name, date in hexdocs_projects:
    parsed_date = datetime.strptime(date[:10], '%Y-%m-%d')
    younger_than_x_days = (now - parsed_date).days <= PROJECT_MAX_AGE_DAYS
    (young_projects if younger_than_x_days else old_projects).append((name, date))

  projects = sorted(young_projects + elixir_core_projects) + old_projects
  projects = [{'name': name, 'lastmod': lastmod} for (name, lastmod) in projects]
  sitemap_dict = {'projects': projects, 'etag': etag}
  save_json_file(cached_sitemap_json_path, sitemap_dict)

  return sitemap_dict

def show_hexdocs_list(window, projects):
  """ Shows the hexdocs projects in a quick panel overlay. """
  project_items = [
      sublime.QuickPanelItem(
          trigger=project['name'],
          details=project['lastmod'] \
            and 'Last modified: %s' % project['lastmod'][:-4].replace('T', ' ') \
            or '',
          kind=sublime.KIND_NAVIGATION
        )
      for project in projects
    ]

  def on_select(i):
    i >= 0 and webbrowser.open_new_tab(HEXDOCS_URL + '/' + projects[i]['name'])

  placeholder = 'Open a project\'s documentation in the web browser.'
  window.show_quick_panel(project_items, on_select, placeholder=placeholder)
