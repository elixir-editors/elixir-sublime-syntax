# SYNTAX TEST "Elixir.sublime-syntax"

## Types

@type
#^^^^ variable.other.constant -keyword.declaration.type
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
@type(name :: any)
#             ^^^ support.type
#     ^^^^ entity.name.type

@type any(any) :: any :: any
#                        ^^^ support.type
#                 ^^^ variable.other.named-type
#         ^^^ variable.parameter
#     ^^^ entity.name.type
@type any!(any!) :: any!
#                   ^^^^ storage.type.custom
#          ^^^^ variable.parameter
#     ^^^^ entity.name.type

@type id(id) :: id :: id | id :: id
#                                ^^ storage.type.custom
#                             ^^ keyword.operator.colon
#                          ^^ variable.other.named-type
#                        ^ keyword.operator.union
#                     ^^ storage.type.custom
#                  ^^ keyword.operator.colon
#               ^^ variable.other.named-type
#            ^^ keyword.operator.colon
#        ^^ variable.parameter
#     ^^ entity.name.type

@type id(
#       ^ punctuation.definition.parameters.begin
        id
#       ^^ variable.parameter
      )
#     ^ punctuation.definition.parameters.end
 ::
#^^ keyword.operator.colon
   id ::
#     ^^ keyword.operator.colon
#  ^^ variable.other.named-type
    id
#   ^^ storage.type.custom
    |
#   ^ keyword.operator.union
     id ::
#       ^^ keyword.operator.colon
#    ^^ variable.other.named-type
     id
#    ^^ storage.type.custom

@type dict(key, value) :: [{key, value}]
#                                ^^^^^ storage.type.custom
#                           ^^^ storage.type.custom
#                    ^ punctuation.definition.parameters.end
#          ^^^ variable.parameter
#         ^ punctuation.definition.parameters.begin
#     ^^^^ entity.name.type

@type paren :: ( any | () )
#                         ^ punctuation.section.group.end -invalid
#                       ^ punctuation.section.group.end -invalid
#                      ^ punctuation.section.group.begin
#                    ^ keyword.operator.union
#                ^^^ support.type
#              ^ punctuation.section.group.begin
@type list :: [ any | [] ]
#                        ^ punctuation.section.brackets.end -invalid
#                      ^ punctuation.section.brackets.end -invalid
#                     ^ punctuation.section.brackets.begin
#                   ^ keyword.operator.union
#               ^^^ support.type
#             ^ punctuation.section.brackets.begin
@type tuple :: { any | {} }
#                         ^ punctuation.section.sequence.end -invalid
#                       ^ punctuation.section.sequence.end -invalid
#                      ^ punctuation.section.sequence.begin
#                    ^ keyword.operator.union
#                ^^^ support.type
#              ^ punctuation.section.sequence.begin

### unquote

@type unquote()
#     ^^^^^^^ keyword.other.unquote
@type unquote()()
#               ^ punctuation.definition.parameters.end
#              ^ punctuation.definition.parameters.begin
#             ^ punctuation.section.arguments.end
#            ^ punctuation.section.arguments.begin
@type unquote(name)
#             ^^^^ variable.other
#     ^^^^^^^ keyword.other.unquote
@type unquote(quote(do: name)) :: any
#                       ^^^^ variable.other
#             ^^^^^ keyword.other.quote
#     ^^^^^^^ keyword.other.unquote
@type(unquote()())
#              ^ punctuation.definition.parameters.begin
#            ^ punctuation.section.arguments.begin
#     ^^^^^^^ keyword.other.unquote
@type enum :: Enum.unquote(:t)
#                            ^ punctuation.section.arguments.end
#                         ^ punctuation.section.arguments.begin
#                  ^^^^^^^ keyword.other.unquote
#                 ^ punctuation.accessor.dot
@type unquote(name)(t) :: unquote(ast)(any) | {unquote_splicing(asts)} | t
#                                                                        ^ storage.type.custom
#                                                               ^^^^ variable.other
#                                              ^^^^^^^^^^^^^^^^ keyword.other.unquote
#                                           ^ keyword.operator.union
#                                      ^^^ support.type
#                                 ^^^ variable.other
#                         ^^^^^^^ keyword.other.unquote
#                    ^ punctuation.definition.parameters.end
#                   ^ variable.parameter
#                  ^ punctuation.definition.parameters.begin
@type unquote :: unquote
#                ^^^^^^^ storage.type.custom
#     ^^^^^^^ entity.name.type
@type unquote :: %unquote(struct_name){id: binary}
#                                          ^^^^^^ support.type
#                         ^^^^^^^^^^^ variable.other
#                 ^^^^^^^ keyword.other.unquote

### Special cases

@type case; @type for; @type if
#                            ^^ entity.name.type
#                 ^^^ entity.name.type
#     ^^^^ entity.name.type
@type nil; @type true; @type false
#                            ^^^^^ constant.language
#                ^^^^ constant.language
#     ^^^ constant.language
@type t :: when :: any
#          ^^^^ keyword.operator.when -variable.other.named-type
@type t :: {else :: any, nil :: nil, when :: any}
#                                    ^^^^ keyword.operator.when -variable.other.named-type
#                        ^^^ constant.language -variable.other.named-type
#           ^^^^ keyword.control.conditional.else -variable.other.named-type

@type; @typep; @opaque
#               ^^^^^^ variable.other
#       ^^^^^ variable.other
#^^^^ variable.other
@type :: any
#        ^^^ variable.other -support.type
#     ^^ keyword.operator.colon
#^^^^ variable.other.constant
@type ::: any
#         ^^^ variable.other -support.type
#     ^^^ constant.other.symbol
#^^^^ keyword.declaration.type
@type t :: %_{}; @type t :: %_Struct{}; @type t :: %_struct{}
#                                                   ^^^^^^^ invalid
#                            ^^^^^^^ invalid
#           ^ invalid
@type do end
#        ^^^ keyword.context.block
#     ^^ keyword.context.block
@type else
#     ^^^^ keyword.control
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
#          ^^ punctuation.section.block.begin keyword.other.fn
@type t :: do any end
#                 ^^^ keyword.context.block
#             ^^^ variable.other
#          ^^ keyword.context.block

## Specifications

@spec run
#     ^^^ variable.other.spec
def run(), do: nil
#<- keyword.declaration.function
@spec spec :: spec
#             ^^^^ storage.type.custom
#     ^^^^ variable.other.spec
@spec :: any
#        ^^^ support.type

@spec -0 :: 0
#           ^ constant.numeric
#        ^^ keyword.operator.colon
#      ^ constant.numeric
#     ^ variable.other.spec
@spec not true :: false
#                 ^^^^^ constant.language
#         ^^^^ constant.language
#     ^^^ variable.other.spec
@spec not false :: true
#                  ^^^^ constant.language
#         ^^^^^ constant.language
#     ^^^ variable.other.spec
@spec !any :: boolean
#          ^^ keyword.operator.colon
#      ^^^ support.type
#     ^ variable.other.spec
@spec +integer :: integer
#                 ^^^^^^^ support.type
#      ^^^^^^^ support.type
#     ^ variable.other.spec
@spec ~~~ integer :: integer
#                    ^^^^^^^ support.type
#         ^^^^^^^ support.type
#     ^^^ variable.other.spec
@spec list -- list :: list
#             ^^^^ support.type
#          ^^ variable.other.spec
#     ^^^^ support.type
@spec any | any :: any
#                  ^^^ support.type
#           ^^^ support.type
#         ^ variable.other.spec
#     ^^^ support.type
@spec @any :: any
#             ^^^ support.type
#      ^^^ support.type
#     ^ variable.other.spec
#^^^^ keyword.declaration.type
@spec String.t() =~ (String.t() | Regex.t()) :: boolean
#                                               ^^^^^^^ support.type
#                                            ^^ keyword.operator.colon
#                                          ^ punctuation.section.group.end
#                                         ^ punctuation.section.arguments.end
#                                        ^ punctuation.section.arguments.begin
#                                       ^ storage.type.remote
#                               ^ keyword.operator.union
#                             ^ punctuation.section.arguments.end
#                            ^ punctuation.section.arguments.begin
#                           ^ storage.type.remote
#                   ^ punctuation.section.group.begin
#                ^^ variable.other.spec
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
#                                                           ^ punctuation.section.group.end
#                                               ^^^^^^^^^^ storage.type.remote
#                                              ^ punctuation.accessor.dot
#                                   ^^^^^^^^^^^ constant.other.symbol
#                                ^^ keyword.operator.colon
#          ^^^^^^^^^^^^^^^^^^^^^ variable.other
#         ^ punctuation.section.group.begin
#       ^ keyword.operator.union
      ) ::
#       ^^ keyword.operator.colon
#     ^ punctuation.section.arguments.end
        on_start_child()
#                     ^ punctuation.section.arguments.begin
#       ^^^^^^^^^^^^^^ storage.type.custom

@spec max(first?, second!) :: first? | second! when first?: term, second!: term
#                                                                          ^^^^ support.type
#                                                                 ^^^^^^^^ constant.other.keyword
#                                                               ^ punctuation.separator.sequence
#                                                           ^^^^ support.type
#                                                   ^^^^^^^ constant.other.keyword
#                                      ^^^^^^^ storage.type.custom
#                             ^^^^^^ storage.type.custom
#                 ^^^^^^^ storage.type.custom
#         ^^^^^^ storage.type.custom

@spec get(named :: t) :: named :: t when t: named :: var
#                                                    ^^^ storage.type.custom
#                                           ^^^^^ variable.other.named-type
#                                        ^^ constant.other.keyword
#                                 ^ storage.type.custom
#                        ^^^^^ variable.other.named-type
#                  ^ storage.type.custom
#         ^^^^^ variable.other.named-type
@spec get(nil_container, any, default) :: default when default: var
#                                                               ^^^ support.type
#                                                      ^^^^^^^^ constant.other.keyword
#                                         ^^^^^^^ storage.type.custom
#                             ^^^^^^^ storage.type.custom
#                        ^^^ support.type
#         ^^^^^^^^^^^^^ storage.type.custom
@spec func(arg) :: arg
#                  ^^^ storage.type.custom
      when
#     ^^^^ keyword.operator.when
           arg:
#          ^^^^ constant.other.keyword
             var
#            ^^^ support.type
             | var()
#                  ^ punctuation.section.arguments.end
#                 ^ punctuation.section.arguments.begin
#              ^^^ storage.type.custom -support.type
#            ^ keyword.operator.union
             | atom
#              ^^^^ support.type
#            ^ keyword.operator.union

@spec any!(any!) :: any!
#                   ^^^^ storage.type.custom
#          ^^^^ storage.type.custom
#     ^^^^ variable.other.spec

@spec next_line
#     ^^^^^^^^^ variable.other.spec
::
 any
#^^^ support.type
@spec next_line_w_args(a, b)
#                      ^ storage.type.custom
#     ^^^^^^^^^^^^^^^^ variable.other.spec
::
 any
#^^^ support.type
@spec next_line
#     ^^^^^^^^^ variable.other.spec
 any :::
#    ^^^ constant.other.symbol
#^^^ variable.function -support.type

@spec multiple_lines()
        ::
#       ^^ keyword.operator.colon
        any
#       ^^^ support.type
        |
#       ^ keyword.operator.union
          any
#         ^^^ support.type
        | any
#         ^^^ support.type
#       ^ keyword.operator.union
 any :::
#    ^^^ constant.other.symbol
#^^^ variable.function -support.type

@spec ::: >= ::: :: boolean
#            ^^^ constant.other.symbol
#     ^^^ constant.other.symbol

@spec integer >>>
#             ^^^ variable.other.spec
#     ^^^^^^^ support.type
        integer ::
#       ^^^^^^^ support.type
        integer
#       ^^^^^^^ support.type

@spec limit..limit :: list when limit: integer
#                                      ^^^^^^^ support.type
#                               ^^^^^^ constant.other.keyword
#                          ^^^^ keyword.operator.when
#                     ^^^^ support.type
#            ^^^^^ storage.type.custom
#          ^^ variable.other.spec
#     ^^^^^ storage.type.custom

# Can't look ahead past newline unfortunately.
@spec integer
#     ^^^^^^^ variable.other.spec
              >>> integer :: integer
#                 ^^^^^^^ variable.other
#             ^^^ keyword.operator.bitwise
@spec integer <<< integer :: integer
#                 ^^^^^^^ support.type
#             ^^^ variable.other.spec
@spec <<>> <> <<>> :: <<>>
#                     ^^^^ string.other.binary
#                  ^^ keyword.operator.colon
#             ^^^^ string.other.binary
#          ^^ variable.other.spec
#     ^^^^ string.other.binary
@spec <<_::8>> <> <<_::8>> :: <<_::8>>
#                               ^ variable.other.named-type
#                   ^ variable.other.named-type
#              ^^ variable.other.spec
#       ^ variable.other.named-type
@spec unquote
#     ^^^^^^^ variable.other.spec
@spec unquote(q)
#     ^^^^^^^ keyword.other
@spec unquote(q) :: any
#                   ^^^ support.type
#     ^^^^^^^ keyword.other
@spec unquote(q)(a, b)
#                    ^ punctuation.section.arguments.end
#               ^ punctuation.section.arguments.begin
@spec unquote(q)(a, b) :: any
#                         ^^^ support.type
@spec unquote(q) + unquote(q) :: number
#                                ^^^^^^ support.type
#                          ^ variable.other
#                  ^^^^^^^ keyword.other
#                ^ variable.other.spec
#             ^ variable.other
#     ^^^^^^^ keyword.other
@spec unquote :: %unquote(struct_name){id: binary}
#                                          ^^^^^^ support.type
#                         ^^^^^^^^^^^ variable.other
#                 ^^^^^^^ keyword.other.unquote
@spec (w | x) + (y | z) :: w | x | y | z
#                  ^ keyword.operator.union
#               ^ punctuation.section.group.begin
#             ^ variable.other.spec
#        ^ keyword.operator.union
#     ^ punctuation.section.group.begin
@spec [x | y] ++ z :: list
#             ^^ variable.other.spec
#        ^ keyword.operator.union
#     ^ punctuation.section.brackets.begin
@spec {x | y} ++ tuple :: tuple
#             ^^ variable.other.spec
#        ^ keyword.operator.union
#     ^ punctuation.section.sequence.begin

@spec integer + integer :: integer

### Other

@callback init(opts :: keyword) :: state
#                                  ^^^^^ storage.type.custom
#                               ^^ keyword.operator.colon
#                      ^^^^^^^ support.type
#              ^^^^ variable.other.named-type
#         ^^^^ variable.other.spec
#^^^^^^^^ keyword.declaration.type

@macrocallback required(atom) :: Macro.t()
#                                      ^ storage.type.remote
#                             ^^ keyword.operator.colon
#                       ^^^^ support.type
#              ^^^^^^^^ variable.other.spec
#^^^^^^^^^^^^^ keyword.declaration.type

### Special cases

@spec 0
#     ^ constant.numeric
@spec "not a spec"
#     ^^^^^^^^^^^^ string.quoted

@spec :when :: :any
#     ^^^^^ constant.other.symbol
@spec when: :: when: :when
#     ^^^^^ constant.other.keyword
@spec func: :invalid :: none
#     ^^^^^ constant.other.keyword
@spec: :invalid :: none
#^^^^^ constant.other.keyword

 @spec func() ::
#      ^^^^ variable.other.spec
 def func()
#    ^^^^ entity.name.function
#^^^ keyword.declaration.function -storage.type -support.type
 @spec func() ::
#      ^^^^ variable.other.spec
 when name: type
#           ^^^^ variable.other -storage.type -support.type
 @spec func() ::
 @const ant
#       ^^^ variable.other -storage.type -support.type
 @spec func() :: @const | type
#                         ^^^^ storage.type.custom
#                 ^^^^^ variable.other.constant

@spec "not a spec"
 still_a_type
#^^^^^^^^^^^^ storage.type.custom
 assert_raise CompileError, ~r"invalid"
#^^^^^^^^^^^^ -storage.type
@spec "not a spec"
end
 not_a_type
#^^^^^^^^^^ -storage.type

@spec >> ;
#     ^^ invalid.illegal.stray-closing-binary
@spec integer >> integer;
#             ^^ invalid.illegal.stray-closing-binary
@spec unquote(ltlt) >> ;
#                   ^^ invalid.illegal.stray-closing-binary
