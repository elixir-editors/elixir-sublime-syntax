# SYNTAX TEST "Elixir.sublime-syntax"

# Miscellaneous

## Literals

 %{}
#  ^ punctuation.section.mapping.end
# ^ punctuation.section.mapping.begin
#^ punctuation.section.mapping.begin
 %{%{}: :%{}}."%{}"
#              ^^^ variable.other.member
#       ^^^^ constant.other.symbol
#  ^^^^ constant.other.keyword
 %__MODULE__{}
#           ^ punctuation.section.mapping.begin
# ^^^^^^^^^^ variable.language.special-form
#^ punctuation.section.mapping.begin
 %__MODULE__.Nested{}
#                  ^ punctuation.section.mapping.begin
#            ^^^^^^ constant.other.module
#           ^ punctuation.accessor.dot
# ^^^^^^^^^^ variable.language.special-form

%module{}
#^^^^^^ variable.other
%^module{}
#^ keyword.operator.pin
%{map | a: :b}
#            ^ punctuation.section.mapping.end
#     ^ keyword.operator.cons
# ^^^ variable.other

 {} {{}} ({}) [{}]
#              ^ punctuation.section.sequence.begin
#         ^ punctuation.section.sequence.begin
#    ^ punctuation.section.sequence.begin
# ^ punctuation.section.sequence.end
#^ punctuation.section.sequence.begin

 (expression; expression) (()) {()} [()]
#                                    ^ punctuation.section.group.begin
#                               ^ punctuation.section.group.begin
#                          ^ punctuation.section.group.begin
#                       ^ punctuation.section.group.end
#           ^ keyword.operator.semicolon
#^ punctuation.section.group.begin

 [] [[]] ([]) {[]}
#              ^ punctuation.section.brackets.begin
#         ^ punctuation.section.brackets.begin
#      ^ punctuation.section.brackets.end
#     ^ punctuation.section.brackets.end
#    ^ punctuation.section.brackets.begin
#   ^ punctuation.section.brackets.begin
# ^ punctuation.section.brackets.end
#^ punctuation.section.brackets.begin

 ]
#^ invalid.illegal.stray-closing-bracket
 )
#^ invalid.illegal.stray-closing-parenthesis
 }
#^ invalid.illegal.stray-closing-brace

 (fn -> ) end)
#       ^ invalid.illegal.stray-closing-parenthesis
 fn -> end
#      ^^^ punctuation.section.block.end keyword.context.block.end
#   ^^ keyword.operator.arrow
#^^ punctuation.section.block.begin keyword.declaration.function
 fn x -> x end
#        ^ variable.other
#   ^ variable.parameter
 fn
   "" <> x -> x
#             ^ variable.other
#        ^ variable.parameter
#          ^^ keyword.operator.arrow

# NB: only the first parameter list can be matched correctly atm.
   x -> x
#    ^^ keyword.operator.arrow
#  ^ variable.other
 end

  list =
    Enum.map(fn )
#            ^^ keyword.declaration.function
#               ^ punctuation.section.arguments.end
#           ^ punctuation.section.arguments.begin
  list
# ^^^^ -variable.parameter

 fn x when x -> x end
#               ^ variable.other
#          ^ variable.other -variable.parameter
#   ^ variable.parameter

fn
   [], acc -> acc
#    ^ punctuation.separator.sequence
   x, acc -> [x | acc]
#   ^ punctuation.separator.sequence
end

(fn x -> fn y -> x + y end end).(1).(2)
#                                   ^ punctuation.section.arguments.begin
#                                  ^ punctuation.accessor.dot
#                               ^ punctuation.section.arguments.begin
#                              ^ punctuation.accessor.dot
#                             ^ punctuation.section.group.end
#                          ^^^ keyword.context.block.end
#                      ^^^ keyword.context.block.end
#                    ^ variable.other
#                  ^ keyword.operator.arithmetic
#                ^ variable.other
#             ^^ keyword.operator.arrow
#           ^ variable.parameter
#        ^^ keyword.declaration.function
#     ^^ keyword.operator.arrow
#   ^ variable.parameter
#^^ keyword.declaration.function
#<- punctuation.section.group.begin

"(((())))"
|> to_charlist()
|> Stream.scan(0, fn ?(, x -> x+1; ?), x -> x-1; _, x -> x end)
#                                                        ^ variable.other
#                                              ^ keyword.operator.semicolon
#                                           ^ variable.other
#                                        ^^ keyword.operator.arrow
#                                  ^^ constant.numeric.char
#                                ^ keyword.operator.semicolon
#                             ^ variable.other
#                          ^^ keyword.operator.arrow
#                        ^ variable.parameter
#                      ^ punctuation.separator.sequence
#                    ^^ constant.numeric.char
#                 ^^ keyword.declaration.function


## Do-block

 do end
#   ^^^ punctuation.section.block.end keyword.context.block.end
#^^^^^^ meta.block
#^^ punctuation.section.block.begin keyword.context.block.do

 do do end end
#          ^^^ keyword.context.block.end
#      ^^^ keyword.context.block.end
#   ^^ keyword.context.block.do
#^^ keyword.context.block.do

## Dot accessor

x.unquote(ast)
#^ punctuation.accessor.dot

x."quoted"
#        ^ punctuation.definition.constant.end
#  ^^^^^^ variable.other.member
# ^ punctuation.definition.constant.begin
x."quoted_func" arg
#             ^ punctuation.definition.constant.end
#  ^^^^^^^^^^^ variable.function
#^ punctuation.accessor.dot

(func).()
#      ^ punctuation.section.arguments.begin
#     ^ punctuation.accessor.dot

%{" ": :" "}." "
#              ^ punctuation.definition.constant.end
#             ^ variable.other.member
#            ^ punctuation.definition.constant.begin
#           ^ punctuation.accessor.dot
%{>: 1}.>>0
#        ^ keyword.operator.comparison
#       ^ variable.other.member
%{>>>: 1}.>>>>0
#            ^ keyword.operator.comparison
#         ^^^ variable.other.member

 and do end
#^^^ keyword.operator.logical
test "", and do
#        ^^^ keyword.operator.logical
#      ^ punctuation.separator.arguments
end

x."member" do end
#  ^^^^^^ variable.function
#^ punctuation.accessor.dot
case x."member" do
#       ^^^^^^ variable.other.member
#     ^ punctuation.accessor.dot
end

x.member do end
# ^^^^^^ variable.function
#^ punctuation.accessor.dot
case x.member do
#      ^^^^^^ variable.other.member
#     ^ punctuation.accessor.dot
end

kernel.|| do end
#      ^^ variable.function
#     ^ punctuation.accessor.dot
case kernel.|| do
#           ^^ variable.other.member
#          ^ punctuation.accessor.dot
end

kernel.or do end
#      ^^ variable.function
#     ^ punctuation.accessor.dot
case kernel.or do
#           ^^ variable.other.member
#          ^ punctuation.accessor.dot
end

Kernel.||
#      ^^ variable.function
#     ^ punctuation.accessor.dot
case Kernel.|| do
#           ^^ variable.function
#          ^ punctuation.accessor.dot
#    ^^^^^^ constant.other.module
end


## Item access

[]
#<- punctuation.section.brackets -punctuation.section.access
["[]":[]][[]]
#         ^ punctuation.section.brackets.begin
#        ^ punctuation.section.access.begin
#     ^ punctuation.section.brackets.begin
 [a: :a][:a]
#          ^ punctuation.section.access.end
#       ^^^^ meta.access
#       ^ punctuation.section.access.begin
#      ^ punctuation.section.brackets.end
#^ punctuation.section.brackets.begin
 [][:a, :b]
#     ^ invalid.illegal.separator
#  ^ punctuation.section.access.begin

%{}[] [][] ()[] ([])[] [[]][] [_:[]][] {[]}[]
#                                          ^ punctuation.section.access.begin
#                                   ^ punctuation.section.access.begin
#                          ^ punctuation.section.access.begin
#                   ^ punctuation.section.access.begin
#            ^ punctuation.section.access.begin
#       ^ punctuation.section.access.begin
#  ^ punctuation.section.access.begin

 x[] x?[] x![] _[] _?[] _![]
#                         ^ punctuation.section.access.begin
#                    ^ punctuation.section.access.begin
#               ^ punctuation.section.access.begin
#           ^ punctuation.section.access.begin
#      ^ punctuation.section.access.begin
# ^ punctuation.section.access.begin

0[] 1[] 2[] 3[] 4[] 5[] 6[] 7[] 8[] 9[]
#                                    ^ punctuation.section.access.begin
#                                ^ punctuation.section.access.begin
#                            ^ punctuation.section.access.begin
#                        ^ punctuation.section.access.begin
#                    ^ punctuation.section.access.begin
#                ^ punctuation.section.access.begin
#            ^ punctuation.section.access.begin
#        ^ punctuation.section.access.begin
#    ^ punctuation.section.access.begin
#^ punctuation.section.access.begin

""[] ''[] ??[]
#           ^ punctuation.section.brackets.begin
#      ^ punctuation.section.access.begin
# ^ punctuation.section.access.begin

do?[] do![] when?[] when![] end?[] end![] else?[] else![]
#                                                      ^ punctuation.section.access.begin
#                                              ^ punctuation.section.access.begin
#                                      ^ punctuation.section.access.begin
#                               ^ punctuation.section.access.begin
#                        ^ punctuation.section.access.begin
#                ^ punctuation.section.access.begin
#        ^ punctuation.section.access.begin
#  ^ punctuation.section.access.begin
after?[] after![] rescue?[] rescue![] catch?[] catch![]
#                                                    ^ punctuation.section.access.begin
#                                           ^ punctuation.section.access.begin
#                                  ^ punctuation.section.access.begin
#                        ^ punctuation.section.access.begin
#              ^ punctuation.section.access.begin
#     ^ punctuation.section.access.begin
not?[] not![] and?[] and![] in?[] in![] or?[] or![]
#                                                ^ punctuation.section.access.begin
#                                          ^ punctuation.section.access.begin
#                                    ^ punctuation.section.access.begin
#                              ^ punctuation.section.access.begin
#                        ^ punctuation.section.access.begin
#                 ^ punctuation.section.access.begin
#          ^ punctuation.section.access.begin
#   ^ punctuation.section.access.begin

do[] when[] else[] after[] rescue[]
#                                ^ punctuation.section.brackets.begin
#                       ^ punctuation.section.brackets.begin
#               ^ punctuation.section.brackets.begin
#        ^ punctuation.section.brackets.begin
# ^ punctuation.section.brackets.begin
catch[] not[] and[] in[] or[] fn[]->end
#                               ^ punctuation.section.brackets.begin
#                          ^ punctuation.section.brackets.begin
#                     ^ punctuation.section.brackets.begin
#                ^ punctuation.section.brackets.begin
#          ^ punctuation.section.brackets.begin
#    ^ punctuation.section.brackets.begin
end[]
#  ^ punctuation.section.access.begin

![] $[] %[] &[] *[] +[] ,[] -[] .[] /[]
#                                    ^ punctuation.section.brackets.begin
#                                ^ punctuation.section.brackets.begin
#                            ^ punctuation.section.brackets.begin
#                        ^ punctuation.section.brackets.begin
#                    ^ punctuation.section.brackets.begin
#                ^ punctuation.section.brackets.begin
#            ^ punctuation.section.brackets.begin
#        ^ punctuation.section.brackets.begin
#    ^ punctuation.section.brackets.begin
#^ punctuation.section.brackets.begin

:[] ;[] <[] =[] >[] @[] \\[] ^[] `[] |[] ~[]
#                                         ^ punctuation.section.brackets.begin
#                                     ^ punctuation.section.brackets.begin
#                                 ^ punctuation.section.brackets.begin
#                             ^ punctuation.section.brackets.begin
#                         ^ punctuation.section.brackets.begin
#                    ^ punctuation.section.brackets.begin
#                ^ punctuation.section.brackets.begin
#            ^ punctuation.section.brackets.begin
#        ^ punctuation.section.brackets.begin
#    ^ punctuation.section.brackets.begin
#^ punctuation.section.brackets.begin


## Captures

 &01; &1; &22; &333
#              ^^^^ constant.other.capture
#         ^^^ constant.other.capture
#     ^^ constant.other.capture
#^^^ constant.other.capture

 & &1..&2
#      ^^ constant.other.capture
#    ^^ keyword.operator.range
#  ^^ constant.other.capture

 &:erlang.apply/2
#              ^ punctuation.accessor.arity
#         ^^^^^ variable.other.capture
#        ^ punctuation.accessor.dot

 &Module.{}/0
#          ^ punctuation.accessor.arity
#        ^^ variable.other.capture

 &//2; &</2; &<>/2; &../2; &.../2
#                      ^ punctuation.accessor.arity
#                    ^^ variable.other.capture
#               ^ punctuation.accessor.arity
#             ^^ variable.other.capture
#        ^ punctuation.accessor.arity
#       ^ variable.other.capture
#  ^ punctuation.accessor.arity
# ^ variable.other.capture

 &Module.Sub.SubSub.func/2
#                   ^^^^ variable.other.capture
#                  ^ punctuation.accessor.dot
#            ^^^^^^ constant.other.module
#           ^ punctuation.accessor.dot
#        ^^^ constant.other.module
#       ^ punctuation.accessor.dot
# ^^^^^^ constant.other.module
#^ keyword.operator.capture

 &func/11; &Module.func/22; &Kernel.<>/2
#                                      ^ constant.numeric
#                                     ^ punctuation.accessor.arity
#                                   ^^ variable.other.capture
#                       ^^ constant.numeric
#                      ^ punctuation.accessor.arity
#                  ^^^^ variable.other.capture
#           ^^^^^^ constant.other.module
#          ^ keyword.operator.capture
#      ^^ constant.numeric
#     ^ punctuation.accessor.arity
# ^^^^ variable.other.capture
#^ keyword.operator.capture
 &__MODULE__/0
#           ^ punctuation.accessor.arity
# ^^^^^^^^^^ variable.other.capture
#^ keyword.operator.capture

 &unquote(:apply)/2
#                ^ punctuation.accessor.arity
 &:erlang.unquote(:apply)/2
#                        ^ punctuation.accessor.arity
 &unquote(:erlang).apply/2
#                       ^ punctuation.accessor.arity

# These are semantically invalid, but it complicates the rules to do it correctly.
  &./2
#   ^ punctuation.accessor.arity
#  ^ punctuation.accessor.dot
 &:erlang/2
         ^ keyword.operator -punctuation.accessor
 &Module.Sub/0
            ^ keyword.operator -punctuation.accessor
        ^ punctuation.accessor.dot

 &0; &000
#    ^^^^invalid.illegal.capture
#^^invalid.illegal.capture


## Elixir keywords

 when
#^^^^ keyword.operator.when
 a not in b and c or d
#                 ^^ keyword.operator.logical
#           ^^^ keyword.operator.logical
#      ^^ keyword.operator.logical
#  ^^^ keyword.operator.logical
 catch after rescue
#            ^^^^^^ keyword.control.exception.catch
#      ^^^^^ keyword.control.exception.catch
#^^^^^ keyword.control.exception.catch
 fn end
#   ^^^ keyword.context.block.end
#^^ keyword.declaration.function
 do else end
#   ^^^^ keyword.control.conditional.else
#^^ keyword.context.block.do


## Elixir functions

 if x do end
#^^ keyword.control.conditional
 unless x do end
#^^^^^^ keyword.control.conditional
 case x do end
#^^^^ keyword.control.conditional
 cond do end
#^^^^ keyword.control.conditional
 with {:ok, _} <- x do end
#^^^^ keyword.control.conditional
 for x <- xs do end
#^^^ keyword.control.loop.for
 quote do 1 + 2 end
#^^^^^ keyword.other.quote
 unquote_splicing(xs)
#^^^^^^^^^^^^^^^^ keyword.other.unquote
 unquote(x)
#^^^^^^^ keyword.other.unquote
 defstruct []
#^^^^^^^^^ keyword.declaration
 defrecord :user, []
#^^^^^^^^^ keyword.declaration
 defexception message: "e"
#^^^^^^^^^^^^ keyword.declaration
 defoverridable child_spec: 1
#^^^^^^^^^^^^^^ keyword.declaration
 import X
#^^^^^^ keyword.control.import
 require X
#^^^^^^^ keyword.control.import
 use X
#^^^ keyword.control.import
 receive do end
#^^^^^^^ keyword.control.loop.receive
 try do end
#^^^ keyword.control.exception.try
 raise x
#^^^^^ keyword.control.flow.throw
 reraise x
#^^^^^^^ keyword.control.flow.throw
 throw x
#^^^^^ keyword.control.flow.throw
 exit 1
#^^^^ keyword.control.flow.exit
 super()
#^^^^^ keyword.other.super


## Git merge conflicts

[
<<<<<<< HEAD
#^^^^^^ -souce.elixir text.git.conflict punctuation.section.block.begin
#<- punctuation.section.block.begin
#^^^^^^^^^^^^ text.git.conflict
  key: (
=======
#^^^^^^ -souce.elixir text.git.conflict punctuation.section.block.middle
#<- punctuation.section.block.middle
#^^^^^^^ text.git.conflict
    :value
  )
# ^ -invalid
]
#<- -invalid
>>>>>>> conflicting-branch
#^^^^^^ -souce.elixir text.git.conflict punctuation.section.block.end
#<- punctuation.section.block.end
#^^^^^^^^^^^^^^^^^^^^^^^^^^ text.git.conflict

"""
<<<<<<<
#^^^^^^ punctuation.section.block.begin.git.conflict
AAAA
=======
#^^^^^^ punctuation.section.block.middle.git.conflict
BBBB
>>>>>>>
#^^^^^^ punctuation.section.block.end.git.conflict
"""


## Opaque structs

try to do
#<>
#decimal<>

#Decimal<>
#Decimal<0>
#PID<>
#PID<
#>
#PID<0.1.0>

# {:ok, #PID<0.11.0>}

#Ecto.Schema.Metadata<:built, "my schema", <<0>>>

#Ecto.Association.NotLoaded<association :comment_main_author is not loaded>
end


## Other

x = \
#   ^ punctuation.separator.continuation -constant
1

:"\
# ^ punctuation.separator.continuation
"

:'\
# ^ punctuation.separator.continuation
'

~S"\
#  ^^ -constant.character.escape
"

~s"\
#  ^^ punctuation.separator.continuation -constant
"

"\
#^^ punctuation.separator.continuation -constant
"

~r"\
#  ^^ punctuation.separator.continuation -constant
"

# Not a continuation \
#                    ^^ comment.line.number-sign -punctuation.separator.continuation


## Comment
#^^^^^^^^^^ comment.line.number-sign
#<- punctuation.definition.comment


## Stray closing tokens

( ( ) )
#     ^ punctuation.section.group.end
#   ^ punctuation.section.group.end
( [ ) ]
#     ^ invalid.illegal.stray-closing-bracket
#   ^ punctuation.section.group.end
( { ) }
#     ^ invalid.illegal.stray-closing-brace
#   ^ punctuation.section.group.end
( %{ ) }
#      ^ invalid.illegal.stray-closing-brace
#    ^ punctuation.section.group.end
( << ) >>
#      ^^ invalid.illegal.stray-closing-binary
#    ^ punctuation.section.group.end
( do ) end )
#          ^ punctuation.section.group.end
#    ^ invalid.illegal.stray-closing-parenthesis
( fn -> ) end )
#             ^ punctuation.section.group.end
#       ^ invalid.illegal.stray-closing-parenthesis

[ ( ] )
#     ^ invalid.illegal.stray-closing-parenthesis
#   ^ punctuation.section.brackets.end
[ [ ] ]
#     ^ punctuation.section.brackets.end
#   ^ punctuation.section.brackets.end
[ { ] }
#     ^ invalid.illegal.stray-closing-brace
#   ^ punctuation.section.brackets.end
[ %{ ] }
#      ^ invalid.illegal.stray-closing-brace
#    ^ punctuation.section.brackets.end
[ << ] >>
#      ^^ invalid.illegal.stray-closing-binary
#    ^ punctuation.section.brackets.end
[ do ] end ]
#          ^ punctuation.section.brackets.end
#    ^ invalid.illegal.stray-closing-bracket
[ fn -> ] end ]
#             ^ punctuation.section.brackets.end
#       ^ invalid.illegal.stray-closing-bracket

{ ( } )
#     ^ invalid.illegal.stray-closing-parenthesis
#   ^ punctuation.section.sequence.end
{ [ } ]
#     ^ invalid.illegal.stray-closing-bracket
#   ^ punctuation.section.sequence.end
{ { } }
#     ^ punctuation.section.sequence.end
#   ^ punctuation.section.sequence.end
{ %{ } }
#      ^ punctuation.section.sequence.end
#    ^ punctuation.section.mapping.end
{ << } >>
#      ^^ invalid.illegal.stray-closing-binary
#    ^ punctuation.section.sequence.end
{ do } end }
#          ^ punctuation.section.sequence.end
#    ^ invalid.illegal.stray-closing-brace
{ fn -> } end }
#             ^ punctuation.section.sequence.end
#       ^ invalid.illegal.stray-closing-brace

%{ ( } )
#      ^ invalid.illegal.stray-closing-parenthesis
#    ^ punctuation.section.mapping.end
%{ [ } ]
#      ^ invalid.illegal.stray-closing-bracket
#    ^ punctuation.section.mapping.end
%{ { } }
#      ^ punctuation.section.mapping.end
#    ^ punctuation.section.sequence.end
%{ %{ } }
#       ^ punctuation.section.mapping.end
#     ^ punctuation.section.mapping.end
%{ << } >>
#       ^^ invalid.illegal.stray-closing-binary
#     ^ punctuation.section.mapping.end
%{ do } end }
#           ^ punctuation.section.mapping.end
#     ^ invalid.illegal.stray-closing-brace
%{ fn -> } end }
#              ^ punctuation.section.mapping.end
#        ^ invalid.illegal.stray-closing-brace

<< ( >> )
#       ^ invalid.illegal.stray-closing-parenthesis
#    ^^ punctuation.definition.string.end
<< [ >> ]
#       ^ invalid.illegal.stray-closing-bracket
#    ^^ punctuation.definition.string.end
<< { >> }
#       ^ invalid.illegal.stray-closing-brace
#    ^^ punctuation.definition.string.end
<< %{ >> }
#        ^ invalid.illegal.stray-closing-brace
#     ^^ punctuation.definition.string.end
<< << >> >>
#        ^^ punctuation.definition.string.end
#     ^^ punctuation.definition.string.end
<< do >> end >>
#            ^^ punctuation.definition.string.end
#     ^^ invalid.illegal.stray-closing-binary
<< fn -> >> end >>
#               ^^ punctuation.definition.string.end
#        ^^ invalid.illegal.stray-closing-binary

do ( end )
#        ^ invalid.illegal.stray-closing-parenthesis
do [ end ]
#        ^ invalid.illegal.stray-closing-bracket
do { end }
#        ^ invalid.illegal.stray-closing-brace
do %{ end }
#         ^ invalid.illegal.stray-closing-brace
do << end >>
#         ^^ invalid.illegal.stray-closing-binary

fn -> ( end )
#           ^ invalid.illegal.stray-closing-parenthesis
fn -> [ end ]
#           ^ invalid.illegal.stray-closing-bracket
fn -> { end }
#           ^ invalid.illegal.stray-closing-brace
fn -> %{ end }
#            ^ invalid.illegal.stray-closing-brace
fn -> << end >>
#            ^^ invalid.illegal.stray-closing-binary

def f(<< ( >>) )
#              ^ invalid.illegal.stray-closing-parenthesis
def f(<< [ >>) ]
#              ^ invalid.illegal.stray-closing-bracket
def f(<< { >>) }
#              ^ invalid.illegal.stray-closing-brace
def f(<< %{ >>) }
#               ^ invalid.illegal.stray-closing-brace
def f(<< << >>) >>
#               ^^ invalid.illegal.stray-closing-binary

def f(( ( )) )
#            ^ punctuation.definition.parameters.end
def f(( [ )) ]
#            ^ invalid.illegal.stray-closing-bracket
def f(( { )) }
#            ^ invalid.illegal.stray-closing-brace
def f(( %{ )) }
#             ^ invalid.illegal.stray-closing-brace
def f(( << )) >>
#             ^^ invalid.illegal.stray-closing-binary

def f([ ( ]) )
#            ^ invalid.illegal.stray-closing-parenthesis
def f([ [ ]) ]
#            ^ invalid.illegal.stray-closing-bracket
def f([ { ]) }
#            ^ invalid.illegal.stray-closing-brace
def f([ %{ ]) }
#             ^ invalid.illegal.stray-closing-brace
def f([ << ]) >>
#             ^^ invalid.illegal.stray-closing-binary

def f({ ( }) )
#            ^ invalid.illegal.stray-closing-parenthesis
def f({ [ }) ]
#            ^ invalid.illegal.stray-closing-bracket
def f({ { }) }
#            ^ invalid.illegal.stray-closing-brace
def f({ %{ }) }
#             ^ invalid.illegal.stray-closing-brace
def f({ << }) >>
#             ^^ invalid.illegal.stray-closing-binary

def f(%{ ( }) )
#             ^ invalid.illegal.stray-closing-parenthesis
def f(%{ [ }) ]
#             ^ invalid.illegal.stray-closing-bracket
def f(%{ { }) }
#             ^ invalid.illegal.stray-closing-brace
def f(%{ %{ }) }
#              ^ invalid.illegal.stray-closing-brace
def f(%{ << }) >>
#              ^^ invalid.illegal.stray-closing-binary

<%= ( %> <% ) %>
#           ^ punctuation.section.group.end
#   ^ punctuation.section.group.begin
<%= [ %> <% ] %>
#           ^ punctuation.section.brackets.end
#   ^ punctuation.section.brackets.begin
<%= { %> <% } %>
#           ^ punctuation.section.sequence.end
#   ^ punctuation.section.sequence.begin
<%= %{ %> <% } %>
#            ^ punctuation.section.mapping.end
#    ^ punctuation.section.mapping.begin
<%= << %> <% >> %>
#            ^^ punctuation.definition.string.end
#   ^^ punctuation.definition.string.begin
