# This script can be used in Sublime's Python console.

# Converts the current file to HTML (simple span tags with inline styles.)
view.export_to_html()

# Converts the current selection to HTML.
view.export_to_html(view.sel())
