# SYNTAX TEST "Elixir.sublime-syntax"

## Surface templates

 ~F"""
#^^ meta.string.elixir storage.type.string.elixir
#  ^^^ meta.string.elixir punctuation.definition.string.begin.elixir

  {!-- Comment --}
#              ^^^ punctuation.definition.comment.end.surface
# ^^^^ punctuation.definition.comment.begin.surface
# ^^^^^^^^^^^^^^^^ meta.embedded.surface comment.block.surface

  <Some.App.Component x={y}>
#                         ^ punctuation.section.embedded.end.elixir - source.elixir.embedded
#                        ^ source.elixir.embedded.html
#                       ^ punctuation.section.embedded.begin.elixir - source.elixir.embedded
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
