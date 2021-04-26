# This script can be used in Sublime's Python console
# to determine the count of certain scopes or tokens.
from itertools import groupby
scope_select = "variable.function.built-in.elixir"
sorted(list((len(list(g)), k) for k, g in groupby(sorted([view.substr(x) for x in view.find_by_selector(scope_select)]))))
