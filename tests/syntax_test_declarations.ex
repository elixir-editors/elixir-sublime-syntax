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

defmodule Dynamic.unquote(name).Module do end
#                               ^^^^^^ entity.name.namespace
#                 ^^^^^^^ keyword.other.unquote

module = defmodule unquote(name) do
#                                ^^ keyword.context.block
#                              ^ punctuation.section.arguments.end
#                          ^^^^ variable.other.elixir
#                         ^ punctuation.section.arguments.begin
#                  ^^^^^^^ keyword.other.unquote
#        ^^^^^^^^^ keyword.declaration.module
#      ^ keyword.operator.match
#<- variable.other
end
#<- keyword.context.block

defmodule User, do: defstruct [:name]
#                              ^^^^^ constant.other.symbol
#                   ^^^^^^^^^ keyword.declaration
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
#                  ^^^^^^^ keyword.other.unquote
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
#          ^ punctuation.section.arguments.begin
#<- keyword.declaration.protocol
end
#  ^ punctuation.section.arguments.end

defprotocol(NoBeam, do: nil)
#                          ^ punctuation.section.arguments.end
#                   ^^^ constant.other.keyword
#                 ^ punctuation.separator.arguments
#           ^^^^^^ entity.name.namespace
#          ^ punctuation.section.arguments.begin
#<- keyword.declaration.protocol

### defimpl

defimpl List.Chars, for: Atom do
#                        ^^^^ constant.other.module
#                   ^^^^ constant.other.keyword
#                 ^ punctuation.separator.arguments
#            ^^^^^ constant.other.module
#           ^ punctuation.accessor.dot
#       ^^^^ constant.other.module
#      ^ punctuation.section.arguments.begin
#<- keyword.declaration.implementation
end
#  ^ punctuation.section.arguments.end
defimpl(List.Chars, for: Atom, do: :end)
#                                      ^ punctuation.section.arguments.end
#                            ^ punctuation.separator.arguments
#                 ^ punctuation.separator.arguments
#      ^ punctuation.section.arguments.begin

defimpl Derivable, for: unquote(module) do end
#                               ^^^^^^ variable.other
#                       ^^^^^^^ keyword.other.unquote
defimpl IEx.Info, for: [Date, Time, NaiveDateTime] do end
#                                                ^ punctuation.section.brackets.end
#                                 ^ punctuation.separator.sequence
#                           ^ punctuation.separator.sequence
#                       ^^^^ constant.other.module
#                      ^ punctuation.section.brackets.begin

 defimpl Collectable, for: List do end
#^^^^^^^ keyword.declaration.implementation
 defrecord :user, [:name, :age]
#^^^^^^^^^ keyword.declaration
 defstruct [:id, :name, :address]
#^^^^^^^^^ keyword.declaration
 defexception message: "error"
#^^^^^^^^^^^^ keyword.declaration
 defoverridable child_spec: 1
#^^^^^^^^^^^^^^ keyword.declaration


### def

def
#<- variable.other
def()
#   ^ punctuation.section.arguments.end
#  ^ punctuation.section.arguments.begin -punctuation.definition.parameters.begin
def(())
#    ^ punctuation.section.parens.end
#   ^ punctuation.section.parens.begin -punctuation.definition.parameters.begin
def do end
#         ^ punctuation.section.arguments.end
#      ^^^ punctuation.section.block.end
#   ^^ punctuation.section.block.begin
#  ^ punctuation.section.arguments.begin
#<- keyword.declaration.function
def nil(no_param)
#       ^^^^^^^^ -variable.parameter
#   ^^^ constant.language
def def
#   ^^^ entity.name.function
#<- keyword.declaration.function
def def, do: def
#            ^^^ variable.other
#      ^ punctuation.separator.arguments
#   ^^^ entity.name.function
def def(def), do: def
#                 ^^^ variable.other
#           ^ punctuation.separator.arguments
#          ^ punctuation.definition.parameters.end
#       ^^^ variable.parameter
#      ^ punctuation.definition.parameters.begin
#   ^^^ entity.name.function
def def;
#      ^ keyword.operator.semicolon
#   ^^^ entity.name.function
def def params, do_body
#               ^^^^^^^ variable.parameter
#             ^ punctuation.separator.arguments
#       ^^^^^^ variable.parameter
#   ^^^ entity.name.function
def def p, do: p
#              ^ variable.other
#            ^ punctuation.definition.constant
#          ^^^ constant.other.keyword
def def p,
#         ^ -punctuation.definition.parameters.end -punctuation.section.arguments.end
#        ^ punctuation.separator.arguments
#       ^ variable.parameter
  do: p
#      ^ punctuation.section.arguments.end
#     ^ variable.other
# ^^^ constant.other.keyword
def plus(
      a,
#      ^ punctuation.separator.sequence
#     ^ variable.parameter
      b
#     ^ variable.parameter
    ),
    do: a + b
#            ^ punctuation.section.arguments.end
#           ^ variable.other
#       ^ variable.other
def +value
#   ^ entity.name.function
def -value
#   ^ entity.name.function
def a + b, do: a - b
#                  ^ -variable.parameter
#              ^ -variable.parameter
#     ^ entity.name.function
def a <~ b, do: min(a, b)
#     ^^ entity.name.function
def a ~> b, do: max(a, b)
#     ^^ entity.name.function
def _ && _, do: :error
#        ^ variable.parameter.unused
#     ^^ entity.name.function
#   ^ variable.parameter.unused
def false && _, do: false
#                   ^^^^^ constant.language
#            ^ variable.parameter.unused
#         ^^ entity.name.function
def _ && false, do: false
#        ^^^^^ constant.language
#     ^^ entity.name.function
#   ^ variable.parameter.unused
def left =~ "" when is_binary(left), do: true
#                                  ^ punctuation.separator.arguments
#                             ^^^^ variable.other
#                   ^^^^^^^^^ variable.function.built-in
#              ^^^^ keyword.other
#           ^^ string.quoted.double
#        ^^ entity.name.function
#   ^^^^ variable.parameter
def (lhs) <> (rhs), do: true
#             ^^^ variable.other
#         ^^ entity.name.function
#       ^ punctuation.section.parens.end
#    ^^^  variable.other
#   ^ punctuation.section.parens.begin
def [left] ++ [_ | _] = right, do: [left | right]
#                                   ^^^^ variable.other
#                            ^ punctuation.separator.arguments
#                       ^^^^^ variable.parameter
#                  ^ variable.parameter
#              ^ variable.parameter
#    ^^^^ variable.parameter
def unquote(head), do: :x
#                ^ punctuation.separator.arguments
#           ^^^^ variable.other
def(unquote(head)(a))
#                 ^ variable.parameter
(def unquote(head)(a))
#                  ^ variable.parameter
def unquote(name)(a, b), do: :x
#                 ^ variable.parameter
#           ^^^^ variable.other
def unquote(name)(unquote_splicing(args)), do: unquote(compiled)
#                                                      ^^^^^^^^ variable.other
#                                              ^^^^^^^ keyword.other
#                                       ^ punctuation.definition.parameters.end
#                                  ^^^^ variable.other
#                 ^^^^^^^^^^^^^^^^ keyword.other
#                ^ punctuation.definition.parameters.begin
#           ^^^^ variable.other
#   ^^^^^^^ keyword.other

def fun!() do end; def fun?() do end
#                      ^^^^ entity.name.function
#   ^^^^ entity.name.function
def(line)
#   ^^^^ entity.name.function
def(line, do: __ENV__.line) var
#                           ^^^ -variable.parameter
#                         ^ punctuation.section.arguments.end
#         ^^^ constant.other.keyword
#   ^^^^ entity.name.function
#  ^ punctuation.section.arguments.begin
(def line)
#    ^^^^ entity.name.function
#<- punctuation.section.parens.begin
(def line do 1 end)
#                 ^ punctuation.section.parens.end
#    ^^^^ entity.name.function
(def line do: 1)
#              ^ -invalid
[def line, do: 1]
#               ^ -invalid
{def line, do: 1}
#               ^ -invalid
(def line, do: 1)
#               ^ -invalid
#        ^ punctuation.separator.arguments
do def line do:::end end
#                    ^^^ punctuation.section.block.end -invalid
#                ^^^ punctuation.section.block.end -invalid
#           ^^ keyword.context.block
do def line, do: :::end
#                   ^^^ punctuation.section.block.end -invalid
#                ^^^ constant.other.symbol
#<- punctuation.section.block.begin

def ault(x \\
#          ^^ keyword.operator.default
#        ^ variable.parameter
  x,
#  ^ punctuation.separator.sequence
# ^ variable.other
  \\:
# ^^^ constant.other.keyword -keyword.operator.default
 y), do: {x, y}
#  ^ punctuation.separator.arguments
#^ variable.parameter
def ault(x \\::: x), do: x
#                ^ variable.other -variable.parameter
#            ^^^ constant.other.symbol
#          ^^ keyword.operator.default
#        ^ variable.parameter
def ault(x \\:x x, y \\:" " y) do end
#                           ^ variable.other -variable.parameter
#                      ^^^^ constant.other.symbol
#               ^ variable.other -variable.parameter
#            ^^ constant.other.symbol
#          ^^ keyword.operator.default
#        ^ variable.parameter

def f(x) when x do end
#             ^ variable.other -variable.parameter -variable.function
def f(x) when x in @enum do
#                   ^^^^ variable.other.constant -variable.parameter -entity.name.constant
#             ^ variable.other -variable.parameter
end

def @attr do attr end
#            ^^^^ variable.other
#    ^^^^ variable.parameter
#   ^ entity.name.function

def changeset(%__MODULE__{} = model \\ %__MODULE__{}, params)
#                                       ^^^^^^^^^^ variable.language.special-form
#                             ^^^^^ variable.parameter
#              ^^^^^^^^^^ variable.language.special-form

def handle_info({__MODULE__, :done}, state)
#                                    ^^^^^ variable.parameter
#                ^^^^^^^^^^ variable.language.special-form
def handle_info(@update_counter_message, state)
#                ^^^^^^^^^^^^^^^^^^^^^^ variable.other.constant
#               ^ keyword.operator.attribute
def message(%module{__exception__: true} = exception)
#                                          ^^^^^^^^^ variable.parameter
#                                  ^^^^ constant.language
#                   ^^^^^^^^^^^^^^ constant.other.keyword
#            ^^^^^^ variable.parameter

def unused(_, %_{}, {_}, [_], [_ | _], (_), <<_>>, <<_, _::_>>, _ <> _, _.._)
#                                                                           ^ punctuation.definition.parameters.end
#                                                                          ^ variable.parameter.unused
#                                                                        ^^ keyword.operator.range
#                                                                       ^ variable.parameter.unused
#                                                                    ^ variable.parameter.unused
#                                                                 ^^ keyword.operator.binary-concat
#                                                               ^ variable.parameter.unused
#                                                           ^^ punctuation.definition.string.end
#                                                          ^ storage.type.binary
#                                                       ^ variable.parameter.unused
#                                                    ^ variable.parameter.unused
#                                                  ^^ punctuation.definition.string.begin
#                                              ^^ punctuation.definition.string.end
#                                             ^ variable.parameter.unused
#                                           ^^ punctuation.definition.string.begin
#                                        ^ punctuation.definition.parameters.end
#                                       ^ variable.parameter.unused
#                                      ^ punctuation.definition.parameters.begin
#                                   ^ punctuation.section.brackets.end
#                                  ^ variable.parameter.unused
#                                ^ keyword.operator.cons
#                              ^ variable.parameter.unused
#                             ^ punctuation.section.brackets.begin
#                          ^ punctuation.section.brackets.end
#                         ^ variable.parameter.unused
#                        ^ punctuation.section.brackets.begin
#                     ^ punctuation.section.sequence.end
#                    ^ variable.parameter.unused
#                   ^ punctuation.section.sequence.begin
#                ^ punctuation.section.mapping.end
#               ^ punctuation.section.mapping.begin
#              ^ variable.parameter.unused
#             ^ punctuation.section.mapping.begin
#           ^ punctuation.separator.sequence
#          ^ variable.parameter.unused
#         ^ punctuation.definition.parameters.begin


### alias

alias List
#         ^ punctuation.section.arguments.end
#     ^^^^ meta.path.modules.elixir constant.other.module.elixir
#    ^ punctuation.section.arguments.begin
#<- keyword.control.import.elixir
alias List, as: L
#               ^ meta.path.modules.elixir entity.name.namespace.elixir
#         ^ punctuation.separator.arguments.elixir
#     ^^^^ meta.path.modules.elixir constant.other.module.elixir
alias List,
#         ^ punctuation.separator.arguments.elixir
      as: L
#          ^ punctuation.section.arguments.end
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
#     ^^^^^^^ keyword.other.unquote
alias unquote(path), as: unquote(alias)
#                                ^^^^^ variable.other.elixir
#                        ^^^^^^^ keyword.other.unquote
#             ^^^^ variable.other.elixir
#     ^^^^^^^ keyword.other.unquote
alias unquote(path).Live, as: L
#                             ^ entity.name.namespace.elixir
#             ^^^^ variable.other.elixir
#     ^^^^^^^ keyword.other.unquote
alias ExUnit.EventManager, as: EM
#                              ^^ entity.name.namespace.elixir
#     ^^^^^^^^^^^^^^^^^^^ meta.path.modules.elixir
alias A.B.{C, D}
#              ^ punctuation.section.braces.end.elixir
#          ^ constant.other.module.elixir
#         ^ punctuation.section.braces.begin.elixir
#        ^ punctuation.accessor.dot
alias A. { B . { C , D } }
#                    ^ constant.other.module.elixir
#                ^ constant.other.module.elixir
#            ^ punctuation.accessor.dot
#      ^ punctuation.accessor.dot
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

[alias A]
(alias A)
#       ^ punctuation.section.parens.end
#      ^ constant.other.module
#<- punctuation.section.parens.begin
do alias A end
#          ^^^ punctuation.section.block.end
do alias A, as: B end
#                 ^^^ punctuation.section.block.end

alias Elixir.unquote(Kernel), as: K
#                                 ^ entity.name.namespace
#                          ^ punctuation.section.arguments.end
#                    ^^^^^^ constant.other.module
#                   ^ punctuation.section.arguments.begin
#            ^^^^^^^ keyword.other.unquote
#           ^ punctuation.accessor.dot

### require
require EEx.Tokenizer, as: T
#                          ^ entity.name.namespace.elixir
#       ^^^^^^^^^^^^^ meta.path.modules.elixir
#<- keyword.control.import.elixir
require :"Elixir.Stream.Reducers", as: R
#                                      ^ entity.name.namespace.elixir
#       ^^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.double-quoted.elixir
