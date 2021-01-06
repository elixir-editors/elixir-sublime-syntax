# SYNTAX TEST "Elixir.sublime-syntax"

## Attributes

@attribute :attr
#^^^^^^^^^ entity.name.constant

@other @attribute
#       ^^^^^^^^^ variable.other.constant

@attr? :attr?
#^^^^^ entity.name.constant
@attr! :attr!
#^^^^^ entity.name.constant
@attr
#^^^^ variable.other.constant
@attr?
#^^^^^ variable.other.constant
@attr!
#^^^^^ variable.other.constant

@_ :_
#  ^^ constant.other.symbol
#^ entity.name.constant

@derive Inspect
#       ^^^^^^^ constant.other.module
#^^^^^^ support.attr
@deprecated "Use x instead"
#           ^^^^^^^^^^^^^^^ string.quoted.double
#^^^^^^^^^^ support.attr
@impl true
#     ^^^^ constant.language
#^^^^ support.attr
@file "name.ex"
#     ^^^^^^^^^ string.quoted.double
#^^^^ support.attr
@fallback_to_any true
#                ^^^^ constant.language
#^^^^^^^^^^^^^^^ support.attr
@behaviour EEx.Engine
#          ^^^ constant.other.module
#^^^^^^^^^ support.attr
@vsn "1.0"
#    ^^^^^ string.quoted.double
#^^^ support.attr
@compile inline: [compare: 2]
#        ^^^^^^^ constant.other.keyword
#^^^^^^^ support.attr
@before_compile Hooks
#               ^^^^^ constant.other.module
#^^^^^^^^^^^^^^ support.attr
@after_compile __MODULE__
#              ^^^^^^^^^^ variable.language.special-form
#^^^^^^^^^^^^^ support.attr
@dialyzer {:nowarn_function, func: 1}
#         ^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.sequence.tuple.elixir
#^^^^^^^^ support.attr
@external_resource file
#                  ^^^^ variable.other
#^^^^^^^^^^^^^^^^^ support.attr
@on_load :check_on_load
#        ^^^^^^^^^^^^^^ constant.other.symbol
#^^^^^^^ support.attr
@on_definition {Hooks, :on_def}
#              ^^^^^^^^^^^^^^^^ meta.sequence.tuple.elixir
#^^^^^^^^^^^^^ support.attr
@__MODULE__ __MODULE__
#           ^^^^^^^^^^ variable.language
#^^^^^^^^^^ entity.name.constant
@__CALLER__ __CALLER__
#           ^^^^^^^^^^ variable.language
#^^^^^^^^^^ entity.name.constant
@__ENV__ __ENV__
#        ^^^^^^^ variable.language
#^^^^^^^ entity.name.constant
@__DIR__ __DIR__
#        ^^^^^^^ variable.language
#^^^^^^^ entity.name.constant
@__STACKTRACE__ __STACKTRACE__
#               ^^^^^^^^^^^^^^ variable.language
#^^^^^^^^^^^^^^ entity.name.constant


@derive
#^^^^^^ variable.other.constant
@deprecated
#^^^^^^^^^^ variable.other.constant
@impl
#^^^^ variable.other.constant
@file
#^^^^ variable.other.constant
@fallback_to_any
#^^^^^^^^^^^^^^^ variable.other.constant
@behaviour
#^^^^^^^^^ variable.other.constant
@vsn
#^^^ variable.other.constant
@compile
#^^^^^^^ variable.other.constant
@before_compile
#^^^^^^^^^^^^^^ variable.other.constant
@after_compile
#^^^^^^^^^^^^^ variable.other.constant
@dialyzer
#^^^^^^^^ variable.other.constant
@external_resource
#^^^^^^^^^^^^^^^^^ variable.other.constant
@on_load
#^^^^^^^ variable.other.constant
@on_definition
#^^^^^^^^^^^^^ variable.other.constant

@__MODULE__
#^^^^^^^^^^ variable.other.constant
@__CALLER__
#^^^^^^^^^^ variable.other.constant
@__ENV__
#^^^^^^^ variable.other.constant
@__DIR__
#^^^^^^^ variable.other.constant
@__STACKTRACE__
#^^^^^^^^^^^^^^ variable.other.constant


## Invalid

@Invalid
#^ invalid.illegal.attribute
