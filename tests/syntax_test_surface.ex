# SYNTAX TEST "Elixir.sublime-syntax"

## Surface templates

 ~F"""
#^^ meta.string.elixir storage.type.string.elixir
#  ^^^ meta.string.elixir punctuation.definition.string.begin.elixir

  <Some.App.Component x={y}>
#                       ^^^ source.elixir.interpolated.html
#                     ^ entity.other.attribute-name.html
#           ^^^^^^^^^ entity.name.tag.begin.surface
#       ^^^ entity.name.tag.begin.surface
#  ^^^^ entity.name.tag.begin.surface
  </Some.App.Component>
#            ^^^^^^^^^ entity.name.tag.end.surface
#        ^^^ entity.name.tag.end.surface
#   ^^^^ entity.name.tag.end.surface
"""
#^^ meta.string.elixir punctuation.definition.string.end.elixir
#<- meta.string.elixir punctuation.definition.string.end.elixir
