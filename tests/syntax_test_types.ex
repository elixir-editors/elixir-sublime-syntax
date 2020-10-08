# SYNTAX TEST "Elixir.sublime-syntax"

## Types

# NB: invalid to the compiler without "::" but not worth it to syntactically check it.
@type name
#     ^^^^ entity.name.type
#^^^^ keyword.declaration.type
#<- keyword.operator.attribute
@typep name; @opaque name
#             ^^^^^^ keyword.declaration.type
#^^^^^ keyword.declaration.type
@type name1; @type name2
#                  ^^^^^ entity.name.type
#     ^^^^^ entity.name.type
@type _name
#     ^^^^^ entity.name.type
@type name any
#          ^^^ variable.other
#     ^^^^ entity.name.type
@type name :: any
#             ^^^ support.type
#          ^^ keyword.operator.colon

@type()
#     ^ punctuation.section.arguments.end
#    ^ punctuation.section.arguments.begin
@type(name)
#     ^^^^ entity.name.type

@type any(any) :: any
#                 ^^^ support.type
#         ^^^ variable.parameter
#     ^^^ entity.name.type
@type any!(any!) :: any!
#                   ^^^^ storage.type.custom
#          ^^^^ variable.parameter
#     ^^^^ entity.name.type
@type id(id) :: id
#               ^^ storage.type.custom
#        ^^ variable.parameter
#     ^^ entity.name.type
@type dict(key, value) :: [{key, value}]
#                                ^^^^^ storage.type.custom
#                           ^^^ storage.type.custom
#                    ^ punctuation.definition.parameters.end
#          ^^^ variable.parameter
#         ^ punctuation.definition.parameters.begin
#     ^^^^ entity.name.type

### unquote

@type unquote()
#     ^^^^^^^ keyword.other
@type unquote(name)
#             ^^^^ variable.other
#     ^^^^^^^ keyword.other
@type unquote(quote(do: name)) :: any
#                       ^^^^ variable.other
#             ^^^^^ keyword.other
#     ^^^^^^^ keyword.other
@type(unquote())
#     ^^^^^^^ keyword.other

@type unquote :: any
#     ^^^^^^^ entity.name.type

@type case; @type for; @type if
#                            ^^ entity.name.type
#                 ^^^ entity.name.type
#     ^^^^ entity.name.type
@type nil; @type true; @type false
#                            ^^^^^ constant.language
#                ^^^^ constant.language
#     ^^^ constant.language

@type; @typep; @opaque
#               ^^^^^^ variable.other
#       ^^^^^ variable.other
#^^^^ variable.other

@type do end
#        ^^^ keyword.context.block
#     ^^ keyword.context.block
@type else
#     ^^^^ keyword.other
#^^^^ variable.other

@type when; @type not; @type in; @type or; @type and; @type fn -> end;
@type catch; @type after; @type rescue; @type do; @type else; @type end
@type func: :invalid
#     ^^^^^ constant.other.keyword
@type: :invalid
#^^^^^ constant.other.keyword

# From elixir/pages/typespecs.md
@type all ::
  any | none | atom | map | pid | port | reference | tuple
#                                                    ^^^^^ support.type
#                                        ^^^^^^^^^ support.type
#                                 ^^^^ support.type
#                           ^^^ support.type
#                     ^^^ support.type
#              ^^^^ support.type
#       ^^^^ support.type
# ^^^ support.type
| float | integer | neg_integer | non_neg_integer | pos_integer
#                                                   ^^^^^^^^^^^ support.type
#                                 ^^^^^^^^^^^^^^^ support.type
#                   ^^^^^^^^^^^ support.type
#         ^^^^^^^ support.type
# ^^^^^ support.type
#<- keyword.operator.union
| list(type) | nonempty_list(type) | maybe_improper_list(type1, type2)
#                                                               ^^^^^ storage.type.custom
#                                                        ^^^^^ storage.type.custom
#                                    ^^^^^^^^^^^^^^^^^^^ support.type
#                            ^^^^ storage.type.custom
#              ^^^^^^^^^^^^^ support.type
#      ^^^^ storage.type.custom
# ^^^^ support.type
| nonempty_improper_list(type1, type2) | nonempty_maybe_improper_list(type1, type2)
#                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ support.type
#                               ^^^^^ storage.type.custom
#                        ^^^^^ storage.type.custom
# ^^^^^^^^^^^^^^^^^^^^^^ support.type
# Literals
| :atom | true | false | nil | Module
#                              ^^^^^^ constant.other.module
#                        ^^^ constant.language
#                ^^^^^ constant.language
#         ^^^^ constant.language
# ^^^^^ constant.other.symbol
| <<>> | <<_::size>> | <<_::_*unit>> | <<_::size, _::_*unit>>
#                                                    ^^^^^^ storage.type.binary
#                                                 ^ variable.other.named-type
#                                           ^^^^ storage.type.binary
#                                        ^ variable.other.named-type
#                           ^^^^^^ storage.type.binary
#                        ^ variable.other.named-type
#             ^^^^ storage.type.binary
#          ^ variable.other.named-type
#   ^^ punctuation.definition.string.end
# ^^ punctuation.definition.string.begin
| (-> type)
#     ^^^^ storage.type.custom
| (type1, type2 -> type)
#                  ^^^^ storage.type.custom
# TODO: try to highlight type1 and type2 as parameters?
| (... -> type)
#         ^^^^ storage.type.custom
#  ^^^ keyword.operator.ellipsis
| 1 | 1..10
#        ^^ constant.numeric
#      ^^ keyword.operator.range
#     ^ constant.numeric
# ^ constant.numeric
| [] | [...] | [type] | [type, ...] | [key: value_type]
#                                           ^^^^^^^^^^ storage.type.custom
#                              ^^^ keyword.operator.ellipsis
#                        ^^^^ storage.type.custom
#               ^^^^ storage.type.custom
#       ^^^ keyword.operator.ellipsis
#  ^ punctuation.section.brackets.end
# ^ punctuation.section.brackets.begin
| %{}
| %{key: value_type}
#        ^^^^^^^^^^ storage.type.custom
| %{required(key_type) => value_type}
#                         ^^^^^^^^^^ storage.type.custom
#            ^^^^^^^^ storage.type.custom
#   ^^^^^^^^ keyword.other
| %{optional(key_type) => value_type}
#                         ^^^^^^^^^^ storage.type.custom
#            ^^^^^^^^ storage.type.custom
#   ^^^^^^^^ keyword.other
| %SomeStruct{}
| %SomeStruct{key: value_type}
#                  ^^^^^^^^^^ storage.type.custom
| {} | {:ok, type}
#            ^^^^ storage.type.custom
#  ^ punctuation.section.sequence.end
# ^ punctuation.section.sequence.begin
| term | arity | as_boolean | binary | bitstring | boolean
#                                                  ^^^^^^^ support.type
#                                      ^^^^^^^^^ support.type
#                             ^^^^^^ support.type
#                ^^^^^^^^^^ support.type
#        ^^^^^ support.type
# ^^^^ support.type
| byte | char | charlist | nonempty_charlist | fun | function
#                                                    ^^^^^^^^ support.type
#                                              ^^^ support.type
#                          ^^^^^^^^^^^^^^^^^ support.type
#               ^^^^^^^^ support.type
#        ^^^^ support.type
# ^^^^ support.type
| identifier | iodata | iolist | keyword | keyword | list
#                                                    ^^^^ support.type
#                                          ^^^^^^^ support.type
#                                ^^^^^^^ support.type
#                       ^^^^^^ support.type
#              ^^^^^^ support.type
# ^^^^^^^^^^ support.type
| nonempty_list | maybe_improper_list | nonempty_maybe_improper_list
#                                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ support.type
#                 ^^^^^^^^^^^^^^^^^^^ support.type
# ^^^^^^^^^^^^^ support.type
| mfa | module | no_return | node | number | struct | timeout
#                                                     ^^^^^^^ support.type
#                                            ^^^^^^ support.type
#                                   ^^^^^^ support.type
#                            ^^^^ support.type
#                ^^^^^^^^^ support.type
#       ^^^^^^ support.type
# ^^^ support.type
| String.t()
#          ^ punctuation.section.arguments.end
#         ^ punctuation.section.arguments.begin
#        ^ storage.type.remote
#       ^ punctuation.accessor.dot
# ^^^^^^ constant.other.module
| custom | parametrized(any, type) | __MODULE__
#                                    ^^^^^^^^^^ variable.language.special-form
#                            ^^^^ storage.type.custom
#                       ^^^ support.type
#          ^^^^^^^^^^^^ storage.type.custom
# ^^^^^^ storage.type.custom

@type color :: {red :: integer, green :: integer, blue :: integer}
#                                                 ^^^^ variable.other
#                               ^^^^^ variable.other
#               ^^^ variable.other

@type next_line
#     ^^^^^^^^^ entity.name.type
::
 any
#^^^ support.type

@type next_line_w_params(a, b)
#                        ^ variable.parameter
#     ^^^^^^^^^^^^^^^^^^ entity.name.type
::
 any
#^^^ support.type

@type next_line
#     ^^^^^^^^^ entity.name.type
 any :::
#    ^^^ constant.other.symbol
#^^^ variable.function

@type t :: fn -> any end
#                    ^^^ punctuation.section.block.end keyword.context.block
#          ^^ keyword.declaration.function punctuation.section.block.begin
@type t :: do any end
#                 ^^^ keyword.context.block
#             ^^^ variable.other
#          ^^ keyword.context.block

## Specifications

@spec run
#     ^^^ variable.other.type
def run(), do: nil
#<- keyword.declaration.function

@spec -0 :: 0
#           ^ constant.numeric
#        ^^ keyword.operator.colon
#      ^ constant.numeric
#     ^ variable.other.type
@spec !any :: boolean
#          ^^ keyword.operator.colon
#      ^^^ support.type
#     ^ variable.other.type
@spec +integer :: integer
#                 ^^^^^^^ support.type
#      ^^^^^^^ support.type
#     ^ variable.other.type
@spec ~~~ integer :: integer
#                    ^^^^^^^ support.type
#         ^^^^^^^ support.type
#     ^^^ variable.other.type
@spec list -- list :: list
#             ^^^^ support.type
#          ^^ variable.other.type
#     ^^^^ support.type

@spec String.t() =~ (String.t() | Regex.t()) :: boolean
#                                               ^^^^^^^ support.type
#                                            ^^ keyword.operator.colon
#                                          ^ punctuation.definition.parens.end
#                                         ^ punctuation.section.arguments.end
#                                        ^ punctuation.section.arguments.begin
#                                       ^ storage.type.remote
#                               ^ keyword.operator.union
#                             ^ punctuation.section.arguments.end
#                            ^ punctuation.section.arguments.begin
#                           ^ storage.type.remote
#                   ^ punctuation.definition.parens.begin
#                ^^ variable.other.type
#              ^ punctuation.section.arguments.end
#             ^ punctuation.section.arguments.begin
#            ^ storage.type.remote

@spec func(t) :: MapSet.t(Path.t())
#                                ^^ punctuation.section.arguments.end
#                              ^ storage.type.remote
#                       ^ storage.type.remote
#          ^ storage.type.custom

@spec days_since_epoch(year :: integer, month :: integer, day :: integer) :: integer
#                                                         ^^^ variable.other
#                                       ^^^^^ variable.other
#                      ^^^^ variable.other

@spec start_child(
#                ^ punctuation.section.arguments.begin
        Supervisor.supervisor(),
#                              ^ punctuation.separator.arguments
#                  ^^^^^^^^^^ storage.type.remote
#       ^^^^^^^^^^ constant.other.module
        Supervisor.child_spec()
#                  ^^^^^^^^^^ storage.type.remote
        | {module, term}
#                      ^ punctuation.section.sequence.end
#                  ^^^^ support.type
#                ^ punctuation.separator.sequence
#          ^^^^^^ support.type
#         ^ punctuation.section.sequence.begin
#       ^ keyword.operator.union
        | module
#         ^^^^^^ support.type
#       ^ keyword.operator.union
        | (old_erlang_child_spec :: :supervisor.child_spec())
#                                                           ^ punctuation.definition.parens.end
#                                               ^^^^^^^^^^ storage.type.remote
#                                              ^ punctuation.accessor.dot
#                                   ^^^^^^^^^^^ constant.other.symbol
#                                ^^ keyword.operator.colon
#          ^^^^^^^^^^^^^^^^^^^^^ variable.other
#         ^ punctuation.definition.parens.begin
#       ^ keyword.operator.union
      ) ::
#       ^^ keyword.operator.colon
#     ^ punctuation.section.arguments.end
        on_start_child()
#                     ^ punctuation.section.arguments.begin
#       ^^^^^^^^^^^^^^ storage.type.custom

@spec get(nil_container, any, default) :: default when default: var
#                                                               ^^^ support.type
#                                                      ^^^^^^^^ constant.other.keyword
#                                         ^^^^^^^ storage.type.custom
#                             ^^^^^^^ storage.type.custom
#                        ^^^ support.type
#         ^^^^^^^^^^^^^ storage.type.custom

@spec any!(any!) :: any!
#                   ^^^^ storage.type.custom
#          ^^^^ storage.type.custom
#     ^^^^ variable.other.type

@spec next_line
#     ^^^^^^^^^ variable.other.type
::
 any
#^^^ support.type
@spec next_line_w_args(a, b)
#                      ^ storage.type.custom
#     ^^^^^^^^^^^^^^^^ variable.other.type
::
 any
#^^^ support.type
@spec next_line
#     ^^^^^^^^^ variable.other.type
 any :::
#    ^^^ constant.other.symbol
#^^^ variable.function

@spec integer >>>
#             ^^^ variable.other.type
#     ^^^^^^^ support.type
        integer ::
#       ^^^^^^^ support.type
        integer
#       ^^^^^^^ support.type

# Can't look ahead past newline unfortunately.
@spec integer
#     ^^^^^^^ variable.other.type
              >>> integer :: integer
#                 ^^^^^^^ variable.other
#             ^^^ keyword.operator.bitwise

@spec :when
#     ^^^^^ constant.other.symbol
@spec when:
#     ^^^^^ constant.other.keyword
@spec func: :invalid
#     ^^^^^ constant.other.keyword
@spec: :invalid
#^^^^^ constant.other.keyword
