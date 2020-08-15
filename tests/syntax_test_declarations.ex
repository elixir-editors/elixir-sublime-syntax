# SYNTAX TEST "Packages/ElixirSyntax/Elixir.sublime-syntax"

## Declarations

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

### require
require EEx.Tokenizer, as: T
#                          ^ entity.name.namespace.elixir
#       ^^^^^^^^^^^^^ meta.path.modules.elixir
#<- keyword.control.import.elixir
require :"Elixir.Stream.Reducers", as: R
#                                      ^ entity.name.namespace.elixir
#       ^^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.double-quoted.elixir
