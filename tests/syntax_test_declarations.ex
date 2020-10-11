# SYNTAX TEST "Elixir.sublime-syntax"

## Declarations

### defmodule

defmodule
#<- variable.other
do defmodule end
#            ^^^ keyword.context
#  ^^^^^^^^^ variable.other
#<- keyword.context
defmodule Module
#         ^^^^^^ entity.name.namespace
#<- keyword.declaration.module
defmodule App.Module
#             ^^^^^^ entity.name.namespace
#            ^ punctuation.accessor
#         ^^^ constant.other.module
defmodule :"Elixir.ModuleTest.RawModule"
#         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol
defmodule :Module
#          ^^^^^^ entity.name.namespace
defmodule :App.:Module
#               ^^^^^^ entity.name.namespace
#              ^ punctuation.definition.constant.begin
#             ^ punctuation.accessor
#         ^^^^ constant.other.symbol
defmodule :<<>>
#          ^^^^ entity.name.namespace
defmodule :&&, do: def(a &&& b, do: a && b); :&&.&&&(:&, :&)
#                                                        ^^ constant.other.symbol
#                                                    ^^ constant.other.symbol
#                                                ^^^ variable.function
#                                            ^^^ constant.other.symbol
#                                          ^ keyword.operator.semicolon
#                        ^^^ entity.name.function
#            ^ punctuation.separator.arguments
#          ^^ entity.name.namespace
#         ^ punctuation.definition.constant.begin
#        ^ punctuation.section.arguments.begin
defmodule _
#         ^ variable.other.unused
defmodule __MODULE__: __MODULE__
#                     ^^^^^^^^^^ variable.language.special-form
#         ^^^^^^^^^^^ constant.other.keyword
defmodule: :Module
#          ^^^^^^^ constant.other.symbol
#<- constant.other.keyword
defmodule __MODULE__.Nested do end
#                    ^^^^^^ entity.name.namespace
#                   ^ punctuation.accessor
#         ^^^^^^^^^^ variable.language.special-form

defmodule nil end; defmodule raise do end
#                            ^^^^^ keyword.other
#         ^^^ constant.language
defmodule fn end; defmodule do end
#                              ^^^ punctuation.section.block.end
#                           ^^ keyword.context.block
#            ^^^ punctuation.section.block.end
#         ^^ punctuation.section.block.begin
#<- keyword.declaration.module

module = defmodule unquote(name) do
#                                ^^ keyword.context.block
#                              ^ punctuation.section.arguments.end
#                          ^^^^ variable.other.elixir
#                         ^ punctuation.section.arguments.begin
#                  ^^^^^^^ keyword.other
#        ^^^^^^^^^ keyword.declaration.module
#      ^ keyword.operator.match
#<- variable.other
end
#<- keyword.context.block

defmodule User, do: defstruct [:name]
#                              ^^^^^ constant.other.symbol
#                   ^^^^^^^^^ keyword.other
#               ^^^ constant.other.keyword
#             ^ punctuation.separator.arguments
#         ^^^^ entity.name.namespace

defmodule(M, do end); defmodule(M, fn -> end) NotAnEntity
#                                             ^^^^^^^^^^^ -entity.name.namespace
#                                        ^^^ punctuation.section.block.end
#                                  ^^ punctuation.section.block.begin
#               ^^^ punctuation.section.block.end
#            ^^ keyword.context.block

defmodule(Dynamic, unquote(block))
#                               ^^ punctuation.section.arguments.end
#                          ^^^^^ variable.other
#                         ^ punctuation.section.arguments.begin
#                  ^^^^^^^ keyword.other
#                ^ punctuation.separator.arguments
#         ^^^^^^^ entity.name.namespace
#        ^ punctuation.section.arguments.begin
#<- keyword.declaration.module

defmodule(Nil, do: (def get_nil() do nil end)) |> elem(1) |> apply(:get_nil, [])
#                                                 ^^^^ variable.function.built-in
#                                              ^^ keyword.operator.pipe
#                                            ^ punctuation.section.arguments.end
#                                           ^ punctuation.section.parens.end
#                                        ^^^ keyword.context.block
#                                 ^^ keyword.context.block
#                       ^^^^^^^ entity.name.function
#                   ^^^ keyword.declaration.function
#                  ^ punctuation.section.parens.begin
#              ^^^ constant.other.keyword

defmodule (NotAModule, do: (import X))
#                                     ^ punctuation.section.arguments.end
#          ^^^^^^^^^^ -entity.name.namespace
#        ^ punctuation.section.arguments.begin


### defprotocol

defprotocol IEx.Info do
#               ^^^^ entity.name.namespace
#           ^^^ constant.other.module
#<- keyword.declaration.protocol

defprotocol(NoBeam, do: nil)
#                          ^ punctuation.section.arguments.end
#                   ^^^ constant.other.keyword
#                 ^ punctuation.separator.arguments
#           ^^^^^^ entity.name.namespace
#          ^ punctuation.section.arguments.begin
#<- keyword.declaration.protocol


### alias
alias List
#     ^^^^ meta.path.modules.elixir constant.other.module.elixir
#<- keyword.control.import.elixir
alias List, as: L
#               ^ meta.path.modules.elixir entity.name.namespace.elixir
#         ^ punctuation.separator.arguments.elixir
#     ^^^^ meta.path.modules.elixir constant.other.module.elixir
alias List,
#         ^ punctuation.separator.arguments.elixir
      as: L
#         ^ entity.name.namespace.elixir
alias List
, as: L
#     ^ constant.other.module.elixir
alias __MODULE__, as: MODULE
#                     ^^^^^^ entity.name.namespace.elixir
#     ^^^^^^^^^^ variable.language.special-form.elixir
alias MODULE, as: __MODULE__
#                 ^^^^^^^^^^ variable.language.special-form.elixir
alias __MODULE__.B.{ C }
#     ^^^^^^^^^^ variable.language.special-form.elixir
#     ^^^^^^^^^^^^^^^^^^ meta.path.modules.elixir
alias unquote(path), as: Alias
#                        ^^^^^ entity.name.namespace.elixir
#             ^^^^ variable.other.elixir
#     ^^^^^^^ keyword.other.elixir
alias unquote(path), as: unquote(alias)
#                                ^^^^^ variable.other.elixir
#                        ^^^^^^^ keyword.other.elixir
#             ^^^^ variable.other.elixir
#     ^^^^^^^ keyword.other.elixir
alias unquote(path).Live, as: L
#                             ^ entity.name.namespace.elixir
#             ^^^^ variable.other.elixir
#     ^^^^^^^ keyword.other.elixir
alias ExUnit.EventManager, as: EM
#                              ^^ entity.name.namespace.elixir
#     ^^^^^^^^^^^^^^^^^^^ meta.path.modules.elixir
alias A.B.{C, D}
#              ^ punctuation.section.braces.end.elixir
#          ^ constant.other.module.elixir
#         ^ punctuation.section.braces.begin.elixir
#        ^ punctuation.accessor.elixir
alias A. { B . { C , D } }
#                    ^ constant.other.module.elixir
#                ^ constant.other.module.elixir
#            ^ punctuation.accessor.elixir
#      ^ punctuation.accessor.elixir
#     ^^^^^^^^^^^^^^^^^^^^ meta.path.modules.elixir
alias A.B.{
#         ^ punctuation.section.braces.begin.elixir
   # X
#  ^ comment
   C,
#   ^ punctuation.separator.sequence.elixir
#  ^ constant.other.module.elixir
   # D,
#  ^ comment
   E,
#  ^ constant.other.module.elixir
# Nesting is semantically invalid, but it's simpler to just highlight it.
   F.{
#    ^ punctuation.section.braces.begin.elixir
     G,
     H
   }
#  ^ punctuation.section.braces.end.elixir
}
#<- punctuation.section.braces.end.elixir
alias A.B, as: C, warn: false
#              ^ entity.name.namespace.elixir
#       ^ constant.other.module.elixir
#     ^ constant.other.module.elixir
alias A.B, warn: false, as: C
#                           ^ entity.name.namespace.elixir
#                ^^^^^ constant.language.elixir
alias nil, as: Null
#              ^^^^ entity.name.namespace.elixir
#     ^^^ constant.language.elixir
alias false, as: False
#                ^^^^^ entity.name.namespace.elixir
#     ^^^^^ constant.language.elixir
alias true, as: True
#               ^^^^ entity.name.namespace.elixir
#     ^^^^ constant.language.elixir
alias :erlang, as: Erlang
#                  ^^^^^^ entity.name.namespace.elixir
#     ^^^^^^^ constant.other.symbol.elixir
alias :lists, as: List
#     ^^^^^^ meta.path.modules.elixir constant.other.symbol.elixir
alias :"Hello.World", as: HW, warn: false

alias(:hello, as: )
#                 ^ punctuation.section.arguments.end.elixir
#    ^ punctuation.section.arguments.begin.elixir
alias(:hello, as: Hello)
#                 ^^^^^ entity.name.namespace.elixir
alias(:hello, warn: false, as: Hello)
#                                   ^ punctuation.section.arguments.end.elixir
#                              ^^^^^ entity.name.namespace.elixir
#                   ^^^^^ constant.language.elixir
#     ^^^^^^ constant.other.symbol.elixir
#    ^ punctuation.section.arguments.begin.elixir

alias (A), as: A
#              ^ entity.name.namespace.elixir
#       ^ punctuation.section.parens.end.elixir
#     ^ punctuation.section.parens.begin.elixir

alias = alias X
#             ^ constant.other.module.elixir
#       ^^^^^ keyword.control.import.elixir
#<- variable.other.elixir

# Semantically invalid, but shouldn't break highlighting.
alias do end
#     ^^ keyword.context.block.elixir
#<- keyword.control.import.elixir

(alias A)
#       ^ punctuation.section.parens.end
#      ^ constant.other.module
#<- punctuation.section.parens.begin

### require
require EEx.Tokenizer, as: T
#                          ^ entity.name.namespace.elixir
#       ^^^^^^^^^^^^^ meta.path.modules.elixir
#<- keyword.control.import.elixir
require :"Elixir.Stream.Reducers", as: R
#                                      ^ entity.name.namespace.elixir
#       ^^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.double-quoted.elixir
