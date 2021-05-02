# SYNTAX TEST "Elixir.sublime-syntax"

## Attributes

@attr :attr
#          ^ punctuation.section.arguments.end
#    ^ punctuation.section.arguments.begin
#^^^^ entity.name.constant
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

@other @attr
#       ^^^^ variable.other.constant
#      ^ keyword.operator.attribute

@fn_attr fn a -> a end
#                  ^^^ keyword.context.block.end
#        ^^ keyword.other.fn
#^^^^^^^ entity.name.constant
@fn_attr.(:a)
#           ^ punctuation.section.arguments.end
#        ^ punctuation.section.arguments.begin
#       ^ punctuation.accessor.dot
#^^^^^^^ variable.other.constant

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
@optional_callbacks f1: 1,
#                         ^ -punctuation.section.arguments.end
#                        ^ punctuation.separator.arguments
#                   ^^^ constant.other.keyword
#                  ^ punctuation.section.arguments.begin
#^^^^^^^^^^^^^^^^^^ support.attr
                    f2: 2
#                        ^ punctuation.section.arguments.end
#                   ^^^ constant.other.keyword
@enforce_keys [:id, :name]
#^^^^^^^^^^^^ support.attr

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
@optional_callbacks
#^^^^^^^^^^^^^^^^^^ variable.other.constant
@enforce_keys
#^^^^^^^^^^^^ variable.other.constant


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
