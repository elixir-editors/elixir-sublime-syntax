# SYNTAX TEST "Elixir.sublime-syntax"

## Declarations

### defmodule

defmodule
#<- variable.other
do defmodule end
#            ^^^ keyword.context
#  ^^^^^^^^^ variable.other
#<- keyword.context
defmodule do end
#               ^ punctuation.section.arguments.end
#        ^ punctuation.section.arguments.begin
defmodule do: Module
#                   ^ punctuation.section.arguments.end
#             ^^^^^^ constant.other.module
#        ^ punctuation.section.arguments.begin
defmodule Module
#         ^^^^^^ entity.name.namespace
#<- keyword.declaration.module
defmodule Module?
#                ^ punctuation.section.arguments.end
#               ^ -entity.name.namespace
#         ^^^^^^ entity.name.namespace
defmodule Module!
#                ^ punctuation.section.arguments.end
#               ^ -entity.name.namespace
#         ^^^^^^ entity.name.namespace
defmodule Module? do
#               ^ -entity.name.namespace
#         ^^^^^^ entity.name.namespace
end
#  ^ punctuation.section.arguments.end
defmodule Module! do
#               ^ -entity.name.namespace
#         ^^^^^^ entity.name.namespace
end
#  ^ punctuation.section.arguments.end
defmodule A.Module? do
#                 ^ -entity.name.namespace
#           ^^^^^^ entity.name.namespace
end
#  ^ punctuation.section.arguments.end
defmodule App.Module
#                   ^ punctuation.section.arguments.end
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
#                            ^^^^^ keyword.control
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
#                          ^^^^ variable.other
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
#                                           ^ punctuation.section.group.end
#                                        ^^^ keyword.context.block
#                                 ^^ keyword.context.block
#                       ^^^^^^^ entity.name.function
#                   ^^^ keyword.declaration.function
#                  ^ punctuation.section.group.begin
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
def , do end
#   ^ invalid.illegal.separator
def()
#   ^ punctuation.section.arguments.end
#  ^ punctuation.section.arguments.begin -punctuation.definition.parameters.begin
def(())
#    ^ -punctuation.section.group.end
#   ^ -punctuation.section.group.begin punctuation.definition.parameters.begin
def ()(a) do end
#      ^ variable.parameter
#     ^ punctuation.definition.parameters.begin
#   ^ punctuation.definition.parameters.begin
def do end
#         ^ punctuation.section.arguments.end
#      ^^^ punctuation.section.block.end
#   ^^ punctuation.section.block.begin
#  ^ punctuation.section.arguments.begin
#<- keyword.declaration.function
def do: x
#        ^ punctuation.section.arguments.end
#       ^ variable.other -entity.name.function -variable.parameter
#   ^^^ constant.other.keyword
#  ^ punctuation.section.arguments.begin
def nil(param)
#       ^^^^^ variable.parameter
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
def not@: x, do: not x
#   ^^^^^ constant.other.keyword
def not false, do: true
#       ^^^^^ constant.language
#   ^^^ entity.name.function
def when(x), do: x
#   ^^^^ keyword.operator.when -entity.name.function
def not x when x, do: false
#              ^ variable.other -variable.parameter
def not x, do: not x
#              ^^^ keyword.operator.logical
#       ^ variable.parameter
#   ^^^ entity.name.function
def not(x), do: not(x)
#   ^^^ entity.name.function
def notx, do: :notx
#   ^^^^ entity.name.function
def !x, do: !x
#           ^ -entity.name.function
#   ^ entity.name.function
def +x, do: x
#   ^ entity.name.function
def +(x), do: x
#   ^ entity.name.function
def @(x), do: x
#   ^ entity.name.function
def x // y, do: {x, y}
#     ^^ entity.name.function
def x | y, do: {x, y}
#     ^ entity.name.function
def .. a do a end
#   ^^ keyword.operator.range
def ..(a) do a end
#     ^ punctuation.section.group.begin
#   ^^ keyword.operator.range
def ... a do a end
#   ^^^ entity.name.function
def ...(a) do a end
#   ^^^ entity.name.function
def invalid, arg, do: :nothing
#               ^ punctuation.separator.arguments
#            ^^^ variable.other
#          ^ punctuation.separator.arguments
#   ^^^^^^^ entity.name.function
def no_params do
#   ^^^^^^^^^ entity.name.function
end

def string?("" <> _rest)
#                       ^ punctuation.section.arguments.end
#                 ^^^^^ variable.parameter.unused
#              ^^ keyword.operator.binary-concat
#           ^^ string.quoted.double
def left =~ "" when is_binary(left), do: true
#                                  ^ punctuation.separator.arguments
#                             ^^^^ variable.other
#                   ^^^^^^^^^ variable.function.built-in
#              ^^^^ keyword.operator
#           ^^ string.quoted.double
#        ^^ entity.name.function
#   ^^^^ variable.parameter
def (lhs) <> (rhs), do: lhs <> rhs
#                              ^^^ variable.other
#                           ^^ keyword.operator.binary-concat
#                       ^^^ variable.other
#             ^^^ -variable.other
#         ^^ entity.name.function
#       ^ -punctuation.section.group.end
#    ^^^  -variable.other
#   ^ -punctuation.section.group.begin
def [left] ++ [_ | _] = right, do: [left | right]
#                                   ^^^^ variable.other
#                            ^ punctuation.separator.arguments
#                       ^^^^^ variable.parameter
#                  ^ variable.parameter
#              ^ variable.parameter
#    ^^^^ variable.parameter

def {}: :{}
#   ^^ -entity.name.function
def {}, do: :{}
#   ^^ entity.name.function
def {a}
#     ^ entity.name.function
#    ^ variable.parameter
#   ^ entity.name.function
def {[a], (b), {c}}
#                 ^ entity.name.function
#                ^ punctuation.section.sequence.end
#               ^ variable.parameter
#              ^ punctuation.section.sequence.begin
#          ^ variable.parameter
#     ^ variable.parameter
#   ^ entity.name.function
def {}(a) do
#     ^ punctuation.section.group.begin -punctuation.definition.parameters.begin
end

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
def f(%unquote(struct_name){id: id} = struct)
#                                     ^^^^^^ variable.parameter
#                               ^^ variable.parameter
#                          ^ punctuation.section.mapping.begin
#              ^^^^^^^^^^^ variable.other
#      ^^^^^^^ keyword.other.unquote
#     ^ punctuation.section.mapping.begin

def unquote(:.)(a, b), do: {a, b}
#                           ^ variable.other
#               ^ variable.parameter
#            ^ entity.name.function
def unquote(:"\"\"")(x), do: x
#                            ^ variable.other
#                    ^ variable.parameter
#                 ^ punctuation.definition.constant.end
#             ^^^^ entity.name.function
#            ^ punctuation.definition.constant.begin
def unquote(:'arbitrary function name')(x), do: x
#                                    ^ punctuation.definition.constant.end
#             ^^^^^^^^^^^^^^^^^^^^^^^ entity.name.function
#            ^ punctuation.definition.constant.begin
def a >>> b
#          ^ punctuation.section.arguments.end
#     ^^^ entity.name.function
def a <<< b
#          ^ punctuation.section.arguments.end
#     ^^^ entity.name.function
<< def a >>
#        ^^ punctuation.definition.string.end
#       ^ punctuation.section.arguments.end
#      ^ variable.parameter
def f <<a>>
#          ^ punctuation.section.arguments.end
#        ^^ punctuation.definition.string.end
#       ^ variable.parameter
#     ^^ punctuation.definition.string.begin
#   ^ entity.name.function
def <<a>> <> <<b>>, do: <<a, b>>
#                               ^ punctuation.section.arguments.end
#                            ^ variable.other
#                         ^ variable.other
#                 ^ punctuation.separator.arguments
#              ^ variable.parameter
#         ^^ entity.name.function
#     ^ variable.parameter
#   ^^ punctuation.definition.string.begin
def unquote(:{})(a), do: a
#            ^^ entity.name.function
def unquote(:%{})(a), do: a
#            ^^^ entity.name.function
def unquote(:%)(struct, map), do: {struct, map}
#            ^ entity.name.function
def unquote(:<<>>)(a), do: a
#            ^^^^ entity.name.function
def unquote(:::)(a, b), do: {a, b}
#            ^^ entity.name.function
def unquote(::)(a, b), do: {a, b}
#           ^^ keyword.operator.colon
def unquote(:unquote)(expr), do: expr
#                     ^^^^ variable.parameter
#            ^^^^^^^ entity.name.function
def unquote(:"#{prefix}_func")(), do: :_
#                      ^^^^^ entity.name.function
#                     ^ punctuation.section.interpolation.end
#               ^^^^^^ variable.other
#             ^^ punctuation.section.interpolation.begin

def bool?(bool) when
#                   ^ -punctuation.section.arguments.end
                is_boolean(bool),
#                                ^ -punctuation.section.arguments.end
#                               ^ punctuation.separator.arguments
    do: bool
#           ^ punctuation.section.arguments.end
def bool?(bool)
    when is_boolean(bool),
# FIXME:
                         ^ punctuation.separator.arguments
    do: bool

defp inspectable_end?(<<char, rest::binary>>)
     when char in ?A..?Z
     when char in ?a..?z
     when char in ?0..?9
     when char == ?_,
                    ^ punctuation.separator.arguments
     do: inspectable_end?(rest)

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
#<- punctuation.section.group.begin
(def line do 1 end)
#                 ^ punctuation.section.group.end
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

def __MODULE__(), do: __MODULE__
#                     ^^^^^^^^^^ variable.language
#   ^^^^^^^^^^ entity.name.function
def __CALLER__(), do: __CALLER__
#                     ^^^^^^^^^^ variable.language
#   ^^^^^^^^^^ entity.name.function
def __ENV__(), do: __ENV__
#                  ^^^^^^^ variable.language
#   ^^^^^^^ entity.name.function
def __DIR__(), do: __DIR__
#                  ^^^^^^^ variable.language
#   ^^^^^^^ entity.name.function
def __STACKTRACE__(), do: __STACKTRACE__
#                         ^^^^^^^^^^^^^^ variable.language
#   ^^^^^^^^^^^^^^ entity.name.function

 defp func(), do: nil
#     ^^^^ entity.name.function
#^^^^ keyword.declaration.function.private

 defmacro l and r, do: l and r
#               ^ variable.parameter.elixir
#           ^^^ entity.name.function.elixir
#         ^ variable.parameter.elixir
 defmacro l in r, do: l in r
#              ^ variable.parameter.elixir
#           ^^ entity.name.function.elixir
#         ^ variable.parameter.elixir
 defmacro l or r, do: l or r
#              ^ variable.parameter.elixir
#           ^^ entity.name.function.elixir
#         ^ variable.parameter.elixir
 defmacro l + r, do: l + r
#           ^ entity.name.function
#^^^^^^^^ keyword.declaration.function.public
 defmacrop l + r, do: l + r
#            ^ entity.name.function
#^^^^^^^^^ keyword.declaration.function.private
 defguard is_x(x), do: x == :x
#         ^^^^ entity.name.function
#^^^^^^^^ keyword.declaration.function.public
 defguardp is_x(x), do: x == :x
#          ^^^^ entity.name.function
#^^^^^^^^^ keyword.declaration.function.private
 defdelegate func(), to: Other, as: :func
#                             ^ punctuation.separator.arguments
#                  ^ punctuation.separator.arguments
#            ^^^^ entity.name.function
#^^^^^^^^^^^ keyword.declaration.function.public
 defdelegatep func(), to: Other, as: :func
#                              ^ punctuation.separator.arguments
#                   ^ punctuation.separator.arguments
#             ^^^^ variable.function -entity
#^^^^^^^^^^^^ variable.function -keyword
 defmacro quote(opts, block), do: [opts, block]
#                     ^^^^^ variable.parameter
#               ^^^^ variable.parameter
#         ^^^^^ entity.name.function
 defmacro f(x), do: quote do x end
#                              ^^^ keyword.context.block.end
#                            ^ variable.other
#                         ^^ keyword.context.block.do
#                   ^^^^^ variable.other -keyword.other.quote.elixir


### alias

alias List
#         ^ punctuation.section.arguments.end
#     ^^^^ constant.other.module
#    ^ punctuation.section.arguments.begin
#<- keyword.control.import
alias List, as: L
#               ^ entity.name.namespace
#         ^ punctuation.separator.arguments
#     ^^^^ constant.other.module
alias List,
#         ^ punctuation.separator.arguments
      as: L
#          ^ punctuation.section.arguments.end
#         ^ entity.name.namespace
alias List,
      as:
      L
#     ^ entity.name.namespace
alias List
, as: L
#     ^ constant.other.module -entity.name.namespace
alias __MODULE__, as: MODULE
#                     ^^^^^^ entity.name.namespace
#     ^^^^^^^^^^ variable.language.special-form
alias MODULE, as: __MODULE__
#                 ^^^^^^^^^^ variable.language.special-form
alias __MODULE__.B.{ C }
#     ^^^^^^^^^^ variable.language.special-form
alias unquote(path), as: Alias
#                        ^^^^^ entity.name.namespace
#             ^^^^ variable.other
#     ^^^^^^^ keyword.other.unquote
alias unquote(path), as: unquote(alias)
#                                ^^^^^ variable.other
#                        ^^^^^^^ keyword.other.unquote
#             ^^^^ variable.other
#     ^^^^^^^ keyword.other.unquote
alias unquote(path).Live, as: L
#                             ^ entity.name.namespace
#             ^^^^ variable.other
#     ^^^^^^^ keyword.other.unquote
alias A.{unquote(B).unquote(:"#{C}"), D.E}
#                                       ^ constant.other.module
#                                      ^ punctuation.accessor.dot
#                                     ^ constant.other.module
#                                   ^ punctuation.separator.sequence
#                                 ^ constant.other.symbol
#                               ^ constant.other.module
#                           ^^ constant.other.symbol
#                  ^ punctuation.accessor.dot
#                ^ constant.other.module
#        ^^^^^^^ keyword.other.unquote

alias ExUnit.EventManager, as: EM
#                              ^^ entity.name.namespace
alias A.B.{C, D}
#              ^ punctuation.section.braces.end
#          ^ constant.other.module
#         ^ punctuation.section.braces.begin
#        ^ punctuation.accessor.dot
alias A. { B . { C , D } }
#                    ^ constant.other.module
#                ^ constant.other.module
#            ^ punctuation.accessor.dot
#      ^ punctuation.accessor.dot
alias A.B.{
#         ^ punctuation.section.braces.begin
   # X
#  ^ comment
   C,
#   ^ punctuation.separator.sequence
#  ^ constant.other.module
   # D,
#  ^ comment
   E,
#  ^ constant.other.module
# Nesting is semantically invalid, but it's simpler to just highlight it.
   F.{
#    ^ punctuation.section.braces.begin
     G,
     H
   }
#  ^ punctuation.section.braces.end
}
#<- punctuation.section.braces.end
alias A.{:"B.C"}
#              ^ punctuation.section.braces.end
#        ^^^^^^ constant.other.symbol
#       ^ punctuation.section.braces.begin
alias A.B, as: C, warn: false
#              ^ entity.name.namespace
#       ^ constant.other.module
#     ^ constant.other.module
alias A.B, warn: false, as: C
#                           ^ entity.name.namespace
#                ^^^^^ constant.language
alias nil, as: Null
#              ^^^^ entity.name.namespace
#     ^^^ constant.language
alias false, as: False
#                ^^^^^ entity.name.namespace
#     ^^^^^ constant.language
alias true, as: True
#               ^^^^ entity.name.namespace
#     ^^^^ constant.language
alias :erlang, as: Erlang
#                  ^^^^^^ entity.name.namespace
#     ^^^^^^^ constant.other.symbol
alias :lists, as: List
#     ^^^^^^ constant.other.symbol
alias :"Hello.World", as: HW, warn: false
#                           ^ punctuation.separator.arguments
#                   ^ punctuation.separator.arguments

alias(:hello, as: )
#                 ^ punctuation.section.arguments.end
#    ^ punctuation.section.arguments.begin
alias(:hello, as: Hello)
#                 ^^^^^ entity.name.namespace
alias(:hello, warn: false, as: Hello)
#                                   ^ punctuation.section.arguments.end
#                              ^^^^^ entity.name.namespace
#                        ^ punctuation.separator.arguments
#                   ^^^^^ constant.language
#           ^ punctuation.separator.arguments
#     ^^^^^^ constant.other.symbol
#    ^ punctuation.section.arguments.begin

alias (A), as: A
#              ^ entity.name.namespace
#        ^ punctuation.separator.arguments
#       ^ punctuation.section.group.end
#     ^ punctuation.section.group.begin

alias = alias X
#             ^ constant.other.module
#       ^^^^^ keyword.control.import
#<- variable.other

# Semantically invalid, but shouldn't break highlighting.
alias do end
#        ^^^ keyword.context.block
#     ^^ keyword.context.block
#<- keyword.control.import

[alias A]
#       ^ punctuation.section.brackets.end
#      ^ constant.other.module
#<- punctuation.section.brackets.begin
(alias A)
#       ^ punctuation.section.group.end
#      ^ constant.other.module
#<- punctuation.section.group.begin
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
#                          ^ entity.name.namespace
#<- keyword.control.import
require :"Elixir.Stream.Reducers", as: R
#                                      ^ entity.name.namespace
#        ^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.symbol.quoted
#       ^ constant.other.symbol punctuation.definition.constant.begin
