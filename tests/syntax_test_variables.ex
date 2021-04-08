# SYNTAX TEST "Elixir.sublime-syntax"

## Variables

### Unused

 _unused
#^^^^^^^ variable.other.unused

%_{} %_module{}
#     ^^^^^^^ variable.other.unused
#^ variable.other.unused

 _.._ = 1..3
#   ^ variable.other.unused
#^ variable.other.unused


### Keywords or built-in functions as variables

 def
#^^^ variable.other
 defdelegate
#^^^^^^^^^^^ variable.other
 defmacro
#^^^^^^^^ variable.other
 defguard
#^^^^^^^^ variable.other
 defp
#^^^^ variable.other
 defmacrop
#^^^^^^^^^ variable.other
 defguardp
#^^^^^^^^^ variable.other
 defimpl
#^^^^^^^ variable.other
 defmodule
#^^^^^^^^^ variable.other
 defprotocol
#^^^^^^^^^^^ variable.other

 if
#^^ variable.other
 unless
#^^^^^^ variable.other
 case
#^^^^ variable.other
 cond
#^^^^ variable.other
 with
#^^^^ variable.other
 for
#^^^ variable.other
 quote
#^^^^^ variable.other
 unquote
#^^^^^^^ variable.other
 unquote_splicing
#^^^^^^^^^^^^^^^^ variable.other
 defstruct
#^^^^^^^^^ variable.other
 defrecord
#^^^^^^^^^ variable.other
 defexception
#^^^^^^^^^^^^ variable.other
 defoverridable
#^^^^^^^^^^^^^^ variable.other
 import
#^^^^^^ variable.other
 require
#^^^^^^^ variable.other
 use
#^^^ variable.other
 receive
#^^^^^^^ variable.other
 try
#^^^ variable.other
 raise
#^^^^^ variable.other
 reraise
#^^^^^^^ variable.other
 throw
#^^^^^ variable.other
 exit
#^^^^ variable.other
 super
#^^^^^ variable.other

### Built-ins as variables

 is_atom
#^^^^^^^ variable.other
 is_binary
#^^^^^^^^^ variable.other
 is_bitstring
#^^^^^^^^^^^^ variable.other
 is_boolean
#^^^^^^^^^^ variable.other
 is_float
#^^^^^^^^ variable.other
 is_function
#^^^^^^^^^^^ variable.other
 is_integer
#^^^^^^^^^^ variable.other
 is_list
#^^^^^^^ variable.other
 is_map
#^^^^^^ variable.other
 is_nil
#^^^^^^ variable.other
 is_number
#^^^^^^^^^ variable.other
 is_pid
#^^^^^^ variable.other
 is_port
#^^^^^^^ variable.other
 is_record
#^^^^^^^^^ variable.other
 is_reference
#^^^^^^^^^^^^ variable.other
 is_tuple
#^^^^^^^^ variable.other
 is_exception
#^^^^^^^^^^^^ variable.other

 abs
#^^^ variable.other
 bit_size
#^^^^^^^^ variable.other
 byte_size
#^^^^^^^^^ variable.other
 div
#^^^ variable.other
 elem
#^^^^ variable.other
 hd
#^^ variable.other
 length
#^^^^^^ variable.other
 map_size
#^^^^^^^^ variable.other
 node
#^^^^ variable.other
 rem
#^^^ variable.other
 round
#^^^^^ variable.other
 tl
#^^ variable.other
 trunc
#^^^^^ variable.other
 tuple_size
#^^^^^^^^^^ variable.other


### Keywords with ? or ! as suffix

 fn?; fn!
#     ^^^ variable.other
#^^^ variable.other
 in?; in!
#     ^^^ variable.other
#^^^ variable.other
 or?; or!
#     ^^^ variable.other
#^^^ variable.other
 not?; not!
#      ^^^^ variable.other
#^^^^ variable.other
 nil?; nil!
#      ^^^^ variable.other
#^^^^ variable.other
 and?; and!
#      ^^^^ variable.other
#^^^^ variable.other
 when?; when!
#       ^^^^^ variable.other
#^^^^^ variable.other
 true?; true!
#       ^^^^^ variable.other
#^^^^^ variable.other
 false?; false!
#        ^^^^^^ variable.other
#^^^^^^ variable.other
 after?; after!
#        ^^^^^^ variable.other
#^^^^^^ variable.other
 rescue?; rescue!
#         ^^^^^^^ variable.other
#^^^^^^^ variable.other
 catch?; catch!
#        ^^^^^^ variable.other
#^^^^^^ variable.other
 do?; do!
#     ^^^ variable.other
#^^^ variable.other
 else?; else!
#       ^^^^^ variable.other
#^^^^^ variable.other
 end?; end!
#      ^^^^ variable.other
#^^^^ variable.other

 __MODULE__?; __MODULE__!
#             ^^^^^^^^^^^ variable.other.unused
#^^^^^^^^^^^ variable.other.unused
 __CALLER__?; __CALLER__!
#^^^^^^^^^^^ variable.other.unused
 __ENV__?; __ENV__!
#          ^^^^^^^^ variable.other.unused
#^^^^^^^^ variable.other.unused
 __MODULE__?; __MODULE__!
#             ^^^^^^^^^^^ variable.other.unused
#^^^^^^^^^^^ variable.other.unused
 __DIR__?; __DIR__!
#          ^^^^^^^^ variable.other.unused
#^^^^^^^^ variable.other.unused
 __STACKTRACE__?; __STACKTRACE__!
#                 ^^^^^^^^^^^^^^^ variable.other.unused
#^^^^^^^^^^^^^^^ variable.other.unused


### Member variables

x._not_unused
# ^^^^^^^^^^^ variable.other.member -variable.other.unused

x.def
# ^^^ variable.other.member
x.defdelegate
# ^^^^^^^^^^^ variable.other.member
x.defmacro
# ^^^^^^^^ variable.other.member
x.defguard
# ^^^^^^^^ variable.other.member
x.defp
# ^^^^ variable.other.member
x.defmacrop
# ^^^^^^^^^ variable.other.member
x.defguardp
# ^^^^^^^^^ variable.other.member
x.defimpl
# ^^^^^^^ variable.other.member
x.defmodule
# ^^^^^^^^^ variable.other.member
x.defprotocol
# ^^^^^^^^^^^ variable.other.member

x.if
# ^^ variable.other.member
x.unless
# ^^^^^^ variable.other.member
x.case
# ^^^^ variable.other.member
x.cond
# ^^^^ variable.other.member
x.with
# ^^^^ variable.other.member
x.for
# ^^^ variable.other.member
x.quote
# ^^^^^ variable.other.member
x.unquote
# ^^^^^^^ variable.other.member
x.unquote_splicing
# ^^^^^^^^^^^^^^^^ variable.other.member
x.defstruct
# ^^^^^^^^^ variable.other.member
x.defrecord
# ^^^^^^^^^ variable.other.member
x.defexception
# ^^^^^^^^^^^^ variable.other.member
x.defoverridable
# ^^^^^^^^^^^^^^ variable.other.member
x.import
# ^^^^^^ variable.other.member
x.require
# ^^^^^^^ variable.other.member
x.use
# ^^^ variable.other.member
x.receive
# ^^^^^^^ variable.other.member
x.try
# ^^^ variable.other.member
x.raise
# ^^^^^ variable.other.member
x.reraise
# ^^^^^^^ variable.other.member
x.throw
# ^^^^^ variable.other.member
x.exit
# ^^^^ variable.other.member
x.super
# ^^^^^ variable.other.member

x.is_atom
# ^^^^^^^ variable.other.member
x.is_binary
# ^^^^^^^^^ variable.other.member
x.is_bitstring
# ^^^^^^^^^^^^ variable.other.member
x.is_boolean
# ^^^^^^^^^^ variable.other.member
x.is_float
# ^^^^^^^^ variable.other.member
x.is_function
# ^^^^^^^^^^^ variable.other.member
x.is_integer
# ^^^^^^^^^^ variable.other.member
x.is_list
# ^^^^^^^ variable.other.member
x.is_map
# ^^^^^^ variable.other.member
x.is_nil
# ^^^^^^ variable.other.member
x.is_number
# ^^^^^^^^^ variable.other.member
x.is_pid
# ^^^^^^ variable.other.member
x.is_port
# ^^^^^^^ variable.other.member
x.is_record
# ^^^^^^^^^ variable.other.member
x.is_reference
# ^^^^^^^^^^^^ variable.other.member
x.is_tuple
# ^^^^^^^^ variable.other.member
x.is_exception
# ^^^^^^^^^^^^ variable.other.member

x.abs
# ^^^ variable.other.member
x.bit_size
# ^^^^^^^^ variable.other.member
x.byte_size
# ^^^^^^^^^ variable.other.member
x.div
# ^^^ variable.other.member
x.elem
# ^^^^ variable.other.member
x.hd
# ^^ variable.other.member
x.length
# ^^^^^^ variable.other.member
x.map_size
# ^^^^^^^^ variable.other.member
x.node
# ^^^^ variable.other.member
x.rem
# ^^^ variable.other.member
x.round
# ^^^^^ variable.other.member
x.tl
# ^^ variable.other.member
x.trunc
# ^^^^^ variable.other.member
x.tuple_size
# ^^^^^^^^^^ variable.other.member

x.fn
# ^^ variable.other.member
x.in
# ^^ variable.other.member
x.or
# ^^ variable.other.member
x.not
# ^^^ variable.other.member
x.nil
# ^^^ variable.other.member
x.and
# ^^^ variable.other.member
x.when
# ^^^^ variable.other.member
x.true
# ^^^^ variable.other.member
x.false
# ^^^^^ variable.other.member
x.after
# ^^^^^ variable.other.member
x.rescue
# ^^^^^^ variable.other.member
x.catch
# ^^^^^ variable.other.member
x.do
# ^^ variable.other.member
x.else
# ^^^^ variable.other.member
x.end
# ^^^ variable.other.member

x.__MODULE__ x.__MODULE__
#              ^^^^^^^^^^ variable.other.member
# ^^^^^^^^^^ variable.function
x.__CALLER__ x.__CALLER__
#              ^^^^^^^^^^ variable.other.member
# ^^^^^^^^^^ variable.function
x.__ENV__ x.__ENV__
#           ^^^^^^^ variable.other.member
# ^^^^^^^ variable.function
x.__MODULE__ x.__MODULE__
#              ^^^^^^^^^^ variable.other.member
# ^^^^^^^^^^ variable.function
x.__DIR__ x.__DIR__
#           ^^^^^^^ variable.other.member
# ^^^^^^^ variable.function
x.__STACKTRACE__ x.__STACKTRACE__
#                  ^^^^^^^^^^^^^^ variable.other.member
# ^^^^^^^^^^^^^^ variable.function

x.=~ x.=~
#      ^^ variable.other.member
# ^^ variable.function
x.= x.=
#     ^ variable.other.member
# ^ variable.function
x.== x.==
#      ^^ variable.other.member
# ^^ variable.function
x.=== x.===
#       ^^^ variable.other.member
# ^^^ variable.function
x.! x.!
#     ^ variable.other.member
# ^ variable.function
x.!= x.!=
#      ^^ variable.other.member
# ^^ variable.function
x.!== x.!==
#       ^^^ variable.other.member
# ^^^ variable.function
x.<<< x.<<<
#       ^^^ variable.other.member
# ^^^ variable.function
x.>>> x.>>>
#       ^^^ variable.other.member
# ^^^ variable.function
x.~~~ x.~~~
#       ^^^ variable.other.member
# ^^^ variable.function
x.:: x.::
#      ^^ variable.other.member
# ^^ variable.function
x.<~> x.<~>
#       ^^^ variable.other.member
# ^^^ variable.function
x.<~ x.<~
#      ^^ variable.other.member
# ^^ variable.function
x.<<~ x.<<~
#       ^^^ variable.other.member
# ^^^ variable.function
x.~> x.~>
#      ^^ variable.other.member
# ^^ variable.function
x.~>> x.~>>
#       ^^^ variable.other.member
# ^^^ variable.function
x.|> x.|>
#      ^^ variable.other.member
# ^^ variable.function
x.<|> x.<|>
#       ^^^ variable.other.member
# ^^^ variable.function
x.// x.//
#      ^^ variable.other.member
# ^^ variable.function
x./ x./
#     ^ variable.other.member
# ^ variable.function
x.\\ x.\\
#      ^^ variable.other.member
# ^^ variable.function
x.* x.*
#     ^ variable.other.member
# ^ variable.function
x.<= x.<=
#      ^^ variable.other.member
# ^^ variable.function
x.>= x.>=
#      ^^ variable.other.member
# ^^ variable.function
x.< x.<
#     ^ variable.other.member
# ^ variable.function
x.> x.>
#     ^ variable.other.member
# ^ variable.function
x.- x.-
#     ^ variable.other.member
# ^ variable.function
x.-- x.--
#      ^^ variable.other.member
# ^^ variable.function
x.--- x.---
#       ^^^ variable.other.member
# ^^^ variable.function
x.+ x.+
#     ^ variable.other.member
# ^ variable.function
x.++ x.++
#      ^^ variable.other.member
# ^^ variable.function
x.+++ x.+++
#       ^^^ variable.other.member
# ^^^ variable.function
x.-> x.->
#      ^^ variable.other.member
# ^^ variable.function
x.<- x.<-
#      ^^ variable.other.member
# ^^ variable.function
x.<> x.<>
#      ^^ variable.other.member
# ^^ variable.function
x.& x.&
#     ^ variable.other.member
# ^ variable.function
x.&& x.&&
#      ^^ variable.other.member
# ^^ variable.function
x.&&& x.&&&
#       ^^^ variable.other.member
# ^^^ variable.function
x.| x.|
#     ^ variable.other.member
# ^ variable.function
x.|| x.||
#      ^^ variable.other.member
# ^^ variable.function
x.||| x.|||
#       ^^^ variable.other.member
# ^^^ variable.function
x.@ x.@
#     ^ variable.other.member
# ^ variable.function
x.^^^ x.^^^
#       ^^^ variable.other.member
# ^^^ variable.function
x.^ x.^
#     ^ variable.other.member
# ^ variable.function

x.{} x.{}
#      ^^ variable.other.member
# ^^ variable.function

x."" x.""
#      ^^ meta.member
# ^^ meta.function-call
x.'' x.''
#      ^^ meta.member
# ^^ meta.function-call

x."\\\"\m\"\\" x."\\\"\m\"\\"
#                     ^^ -constant.character.escape
#                 ^^^^ constant.character.escape
#                 ^^^^^^^^^^ variable.other.member
#                ^^^^^^^^^^^^ meta.member
#      ^^ -constant.character.escape
#  ^^^^ constant.character.escape
#  ^^^^^^ variable.function
# ^^^^^^^^^^^^ meta.function-call
x.'\\\'\m\'\\' x.'\\\'\m\'\\'
#                     ^^ -constant.character.escape
#                 ^^^^ constant.character.escape
#                 ^^^^^^^^^^ variable.other.member
#                ^^^^^^^^^^^^ meta.member
#      ^^ -constant.character.escape
#  ^^^^ constant.character.escape
#  ^^^^^^ variable.function
# ^^^^^^^^^^^^ meta.function-call

# * Exceptions

x.<< x.>>
#      ^^ string.other.binary punctuation.definition.string.end
# ^^ string.other.binary punctuation.definition.string.begin

x.^^
#  ^ keyword.operator.pin
# ^ variable.function
x..
#^^ keyword.operator.range
x...
#^^^ keyword.operator.ellipsis
x....y
#    ^ variable.other.member
#   ^ punctuation.accessor.dot
#^^^ keyword.operator.ellipsis

x.%
# ^ punctuation.section.mapping.begin -variable.other.member
x.%{}
# ^ punctuation.section.mapping.begin -variable.other.member

# * Don't match past end of line
x.
if ok? do
#<- keyword.control.conditional -variable.other.member
  x.
end
#<- keyword.context.block.end -variable.other.member
  x.end
#   ^^^ variable.other.member
  x. end
#    ^^^ variable.other.member


### Before do-block

case __MODULE__ do
#    ^^^^^^^^^^ variable.language.special-form -variable.other.unused
end

case case do
#    ^^^^ variable.other
end

case case.case do
#         ^^^^ variable.other.member
#    ^^^^ variable.other
end

x."\"quoted\"" do end
#  ^^^^^^^^^^ variable.function
case x."\"quoted\"" do
#       ^^ constant.character.escape.char
#       ^^^^^^^^^^ variable.other.member
end

def f() when x."def" do end
#               ^^^ variable.other.member

def f() when def do end
#            ^^^ variable.other

def f() when def.def do end
#                ^^^ variable.other.member
#            ^^^ variable.other


### Special forms

 __MODULE__
#^^^^^^^^^^ variable.language.special-form
 __CALLER__
#^^^^^^^^^^ variable.language.special-form
 __ENV__
#^^^^^^^ variable.language.special-form
 __DIR__
#^^^^^^^ variable.language.special-form
 __STACKTRACE__
#^^^^^^^^^^^^^^ variable.language.special-form
