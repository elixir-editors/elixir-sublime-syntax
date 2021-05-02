# SYNTAX TEST "Elixir.sublime-syntax"

## Documentation comments

# NB: Check that `def` doesn't match past the newline and consumes the closing `"""`.
@doc """
Don't insert a comment between `x` and `"""`.
    iex> def x do
#      ^ keyword.other.iex-angle.elixir punctuation.definition.iex.begin.elixir
#   ^^^^^^^^^^^ markup.raw.block.markdown
#^^^ meta.string.elixir
    ...(1)> {:ok, _} = Repo.insert(post)
#                      ^^^^ constant.other.module.elixir
#           ^^^^^^^^ meta.sequence.tuple.elixir
#         ^ keyword.other.iex-angle.elixir punctuation.definition.iex.begin.elixir
#   ^^^ keyword.other.iex-dots
#^^^ meta.string.elixir
    ...(1)> end
#           ^^^ keyword.context.block.end
#         ^ keyword.other.iex-angle.elixir punctuation.definition.iex.begin.elixir
#   ^^^ keyword.other.iex-dots

    iex(1)> [1 + 2,
#           ^ punctuation.section.brackets.begin.elixir
    ...(1)>  3]
#             ^ punctuation.section.brackets.end.elixir
#            ^ constant.numeric.integer.elixir
#   ^^^ keyword.other.iex-dots
 """m
#   ^ variable.other -meta.string.elixir
#^^^ punctuation.definition.string.end
#^^^ meta.string.elixir

@doc """
#^^^ support.attr.doc
    iex> def x
#   ^^^^^^^^^^^ markup.raw.block.elixir
#^^^ source.markdown.embedded.elixir
 \' \""" #{interpolation}
#          ^^^^^^^^^^^^^ variable.other
#        ^^^^^^^^^^^^^^^^ meta.interpolation.elixir
#   ^^ constant.character.escape.char.elixir
#^^ constant.character.escape.char.elixir
 """
#^^^ punctuation.definition.string.end

# NB: Check that defmodule doesn't match past the newline and consumes the closing `"""`.
@doc """
Don't insert a comment between `X` and `"""`.
   defmodule X
#  ^^^^^^^^^ -keyword.declaration.module
    defmodule X do end
#   ^^^^^^^^^ keyword.declaration.module
#   ^^^^^^^^^^^^ markup.raw.block.markdown
 """m
#   ^ variable.other -meta.string.elixir
#^^^ punctuation.definition.string.end
#^^^ meta.string.elixir

  @doc """
  ```elixir
#    ^^^^^^ constant.other.language-name.elixir
# ^^^ punctuation.definition.code-block.begin.markdown
  @type t :: term
  ```
# ^^^^ punctuation.definition.code-block.end.markdown
  Text.
# ^^^^^^ source.markdown.embedded.elixir
# ^^^^^^ meta.string.elixir
  """

@doc ~S'''
#    ^^^^^^ meta.string.elixir
\'''m
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
#^^^^ meta.string.elixir

@doc ~S"""
#    ^^^^^^ meta.string.elixir
\"""m
#^^^ -punctuation.definition.string.end
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
#^^^^ meta.string.elixir

@doc """
    defmodule X do end
#   ^^^^^^^^^^^^ markup.raw.block.elixir
#^^^ source.markdown.embedded.elixir
 """m
#   ^ -storage.type.string
#^^^ punctuation.definition.string.end

@doc ~S"""
 \'\S\ \""" #{interpolation}
#           ^^^^^^^^^^^^^^^^ -meta.interpolation.elixir
#       ^^^ -punctuation.definition.string.end
#^^^^^^^^ -constant.character.escape
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

@doc ~S'''
#      ^^^ punctuation.definition.string.begin
#    ^^ storage.type.string
 doc
#^^^^ source.markdown.embedded.elixir
 \'\S\ \""" #{interpolation}
#           ^^^^^^^^^^^^^^^^ -meta.interpolation.elixir
#       ^^^ -punctuation.definition.string.end
#^^^^^^^^ -constant.character.escape

    iex> use Bitwise, only_operators: true
#   ^^^ keyword.other.iex
    iex> 1 &&& 1
#   ^^^ keyword.other.iex
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

# NB: no need to support charlist heredoc.
@doc '''
 doc
#^^^^ -source.markdown.embedded.elixir
'''m
#  ^ -storage.type.string
# NB: no need to support `~s"""` which is basically `"""`.
@doc ~s"""
 doc
#^^^^ -source.markdown.embedded.elixir
"""m
#  ^ storage.type.string

@doc false
#         ^ punctuation.section.arguments.end
#    ^^^^^ constant.language
#   ^ punctuation.section.arguments.begin
#^^^ support.attr.doc
@doc(false)
#         ^ punctuation.section.arguments.end
#    ^^^^^ constant.language
#   ^ punctuation.section.arguments.begin
 (@doc false)
#           ^ punctuation.section.group.end
#^ punctuation.section.group.begin

@doc "doc"
#         ^ punctuation.section.arguments.end
#        ^ punctuation.definition.string.end
#     ^^^ source.markdown.embedded.elixir
#    ^ punctuation.definition.string.begin
#   ^ punctuation.section.arguments.begin
@doc("doc")
#         ^ punctuation.section.arguments.end
#        ^ punctuation.definition.string.end
#     ^^^ source.markdown.embedded.elixir
#    ^ punctuation.definition.string.begin
#   ^ punctuation.section.arguments.begin
(@doc "doc")
#      ^^^ source.markdown.embedded.elixir
[@doc "doc"]
#          ^ punctuation.section.brackets.end
#<- meta.brackets.elixir

@doc "\n\"escapes\"\n"
#                     ^ punctuation.section.arguments.end
#                    ^ punctuation.definition.string.end
#                  ^^ constant.character.escape.char
#                ^^ constant.character.escape.char
#         ^^^^^^^ source.markdown.embedded.elixir
#       ^^ constant.character.escape.char
#     ^^ constant.character.escape.char

@doc since: 1.2
#    ^^^^^^ constant.other.keyword
@doc guard: true
#           ^^^^ constant.language
#    ^^^^^^ constant.other.keyword
@doc deprecated: "Use Kernel.length/1 instead"
#    ^^^^^^^^^^^ constant.other.keyword
@doc since: "1.2.3", author: "Author"
#                             ^^^^^^ source.markdown.embedded.elixir
#                  ^ punctuation.separator.arguments.elixir
#           ^^^^^^^ meta.string.elixir
#    ^^^^^^ constant.other.keyword
@doc since: "1.2.3", color: :red, deprecated: "use f/2 instead"
#                               ^ punctuation.separator.arguments.elixir
#                           ^^^^ constant.other.symbol

@doc "Sets foreground color to `#{color}`."
#                                 ^^^^^ variable.other.elixir
#                               ^^^^^^^^ meta.interpolation.elixir

quote(do: @doc guard: false)
#                     ^^^^^ constant.language
#              ^^^^^^ constant.other.keyword
#          ^^^ support.attr.doc

@doc # comment
#    ^^^^^^^^^ comment.line
#^^^ variable.other.constant -support.attr.doc
@doc == "doc"
#       ^^^^^ -source.markdown.embedded.elixir
#    ^^ keyword.operator.comparison
#   ^ -punctuation.section.group.begin
#^^^ variable.other.constant -support.attr.doc

@moduledoc ""
#^^^^^^^^^ support.attr.doc
@typedoc ""
#^^^^^^^ support.attr.doc
@shortdoc ""
#^^^^^^^^ support.attr.doc
