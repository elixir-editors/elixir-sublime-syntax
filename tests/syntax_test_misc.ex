# SYNTAX TEST "Elixir.sublime-syntax"

# Miscellaneous

## Literals

 %{}
#  ^ punctuation.section.mapping.end
# ^ punctuation.section.mapping.begin
#^ punctuation.section.mapping.begin
 %_{}
#   ^ punctuation.section.mapping.end
# ^ variable.other.unused
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
 %Some.Module{}
#            ^ punctuation.section.mapping.begin
#      ^^^^^^ constant.other.module
# ^^^^ constant.other.module
#^ punctuation.section.mapping.begin
 %:Some.Module{}
#             ^ punctuation.section.mapping.begin
# ^^^^^ constant.other.symbol
#^ punctuation.section.mapping.begin
 %:"Some".Module{}
#               ^ punctuation.section.mapping.begin
# ^^^^^^^ constant.other.symbol
#^ punctuation.section.mapping.begin
 %:'Some'.Module{}
#               ^ punctuation.section.mapping.begin
# ^^^^^^^ constant.other.symbol
#^ punctuation.section.mapping.begin

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
#^^ punctuation.section.block.begin keyword.other.fn
 fn x -> x end
#        ^ variable.other
#   ^ variable.parameter
 fn
   "" <> x -> x
#             ^ variable.other
#        ^ variable.parameter
#          ^^ keyword.operator.arrow

   x -> x
#       ^ variable.other
#    ^^ keyword.operator.arrow
#  ^ variable.parameter
 end

# Normally only allowed in a def-block, but it's easier to match the rescue-branch in general.
 do
#^^ keyword.context.block.do
   nil
 rescue
#^^^^^^ keyword.control.exception.catch
   any -> any
#  ^^^ variable.parameter
 end
#^^^ keyword.context.block.end

  list =
    Enum.map(fn )
#               ^ punctuation.section.arguments.end -invalid
#            ^^ keyword.other.fn
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

fn __MODULE__ -> __MODULE__ end
#                ^^^^^^^^^^ variable.language.special-form
#  ^^^^^^^^^^ variable.language.special-form

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
#        ^^ keyword.other.fn
#     ^^ keyword.operator.arrow
#   ^ variable.parameter
#^^ keyword.other.fn
#<- punctuation.section.group.begin

(fn x -> x end).(fn a, b -> {a, b} end).(:b, :c)
#                                       ^ punctuation.section.arguments.begin.elixir
#                                     ^ punctuation.section.arguments.end.elixir
#               ^ punctuation.section.arguments.begin.elixir
#              ^ punctuation.accessor.dot.elixir

fn x -> x end
#         ^^^ punctuation.section.block.end
#       ^ variable.other
#    ^^ keyword.operator.arrow
#  ^ variable.parameter
fn
 x -> x
#     ^ variable.other
#  ^^ keyword.operator.arrow
#^ variable.parameter
y -> y
#    ^ variable.other
# ^^ keyword.operator.arrow
#<- variable.parameter
  z -> z
  #    ^ variable.other -variable.parameter
  # ^^ keyword.operator.arrow
  #<- variable.other -variable.parameter
end
#^^ punctuation.section.block.end
fn -> x; y -> z end
#               ^^^ punctuation.section.block.end
#             ^ variable.other
#          ^^ keyword.operator.arrow
#        ^ -variable.parameter
#     ^ variable.other
#  ^^ keyword.operator.arrow
fn x -> x; y -> y end
#                 ^^^ punctuation.section.block.end
#               ^ variable.other
#            ^^ keyword.operator.arrow
#        ^ keyword.operator.semicolon
#       ^ variable.other
#    ^^ keyword.operator.arrow
#  ^ variable.parameter
fn
    indent4 -> indent4
    #          ^^^^^^^ variable.other
    #^^^^^^ variable.parameter
  indent2 -> indent2
  #          ^^^^^^^ variable.other
  #^^^^^^ variable.parameter
indent0 -> indent0
#          ^^^^^^^ variable.other
#^^^^^^ variable.parameter
end
(fn
#<- meta.parens punctuation.section.group.begin
#^^^ meta.parens
  a ->
    a = f(a) # NB: leave next line empty.

    [a]
    #^ variable.other -variable.parameter
  x, 2, x3 ->
    #      ^^ keyword.operator.arrow
    #   ^^ variable.parameter
    # ^ punctuation.separator.sequence
    #^ constant.numeric.integer
    {x, x3}
    #   ^^ variable.other
    #^ variable.other
  "->" <> y ->
    #       ^^ keyword.operator.arrow
    #     ^ variable.parameter
    #  ^^ keyword.operator.binary-concat
    y
    #<- variable.other
  "#{(fn _ -> "->" end).(a)}", z when z == :-> -> z
    #                                             ^ variable.other
    #                                          ^^ keyword.operator.arrow
    #                                      ^^^ constant.other.symbol
    #                                   ^^ keyword.operator.comparison
    #                                 ^ variable.other
    #                            ^^^^ keyword.operator.when
    #                          ^ variable.parameter
    #                        ^ punctuation.separator.sequence
    #                    ^ variable.other
    #                  ^ punctuation.accessor.dot
    #         ^^^^ string.quoted
    #    ^ variable.parameter.unused
     -> var -> var
    #          ^^^ variable.other
    #       ^^ keyword.operator.arrow
    #   ^^^ variable.other
    #^^ keyword.operator.arrow
    expr
    #^^^ variable.other

  [first | rest] = list, n ->
#                          ^^ keyword.operator.arrow
#                        ^ variable.parameter
#                      ^ punctuation.separator.sequence
#                  ^^^^ variable.parameter
#                ^ keyword.operator.match
#              ^ punctuation.section.brackets.end
#          ^^^^ variable.parameter
#        ^ keyword.operator.cons
#  ^^^^^ variable.parameter
# ^ punctuation.section.brackets.begin
  Enum.reduce(list, {:ok, n}, fn
 _, {:error, _} = error -> error
#                          ^^^^^ variable.other -variable.parameter
#                       ^^ keyword.operator.arrow
#                 ^^^^^ variable.parameter
#               ^ keyword.operator.match
#            ^ variable.parameter.unused
# ^ punctuation.separator.sequence
#^ variable.parameter.unused
 a, {:ok, b} -> if(a > 0, do: {:ok, b / a}, else: {:error, :division_by_zero})
#                                       ^ variable.other -variable.parameter
#                                   ^ variable.other -variable.parameter
#                  ^ variable.other -variable.parameter
#            ^^ keyword.operator.arrow
#         ^ variable.parameter
#       ^ punctuation.separator.sequence
# ^ punctuation.separator.sequence
#^ variable.parameter
end)

  λ when is_function(λ, 1) -> λ.(:λ)
#                                  ^ punctuation.section.arguments.end
#                               ^ punctuation.section.arguments.begin
#                              ^ punctuation.accessor.dot
#                             ^ variable.function
#                          ^^ keyword.operator.arrow
#                        ^ punctuation.section.arguments.end
#                       ^ constant.numeric.integer
#                     ^ punctuation.separator.arguments
#                    ^ variable.other
#                   ^ punctuation.section.arguments.begin
#        ^^^^^^^^^^^ variable.function.built-in
#   ^^^^ keyword.operator.when
# ^ variable.parameter
end)
#  ^ punctuation.section.group.end
#^^ punctuation.section.block.end
#<- punctuation.section.block.end

"(((())))"
|> to_charlist()
|> Stream.scan(0, fn ?(, x -> x+1; ?), x -> x-1; _, x -> x end)
#                                                             ^ punctuation.section.arguments.end
#                                                          ^^^ punctuation.section.block.end
#                                                        ^ variable.other
#                                                     ^^ keyword.operator.arrow
#                                                   ^ variable.parameter
#                                                 ^ punctuation.separator.sequence
#                                                ^ variable.parameter
#                                              ^ keyword.operator.semicolon
#                                             ^ constant.numeric.integer
#                                            ^ keyword.operator.arithmetic
#                                           ^ variable.other
#                                        ^^ keyword.operator.arrow
#                                      ^ variable.parameter
#                                    ^ punctuation.separator.sequence
#                                  ^^ constant.numeric.char
#                                ^ keyword.operator.semicolon
#                               ^ constant.numeric.integer
#                              ^ keyword.operator.arithmetic
#                             ^ variable.other
#                          ^^ keyword.operator.arrow
#                        ^ variable.parameter
#                      ^ punctuation.separator.sequence
#                    ^^ constant.numeric.char
#                 ^^ keyword.other.fn
#             ^ punctuation.section.arguments.begin


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
%{>: 1}.> >0
#         ^ keyword.operator.comparison
#       ^ variable.other.member
%{>: 1}.>>0
#       ^^ punctuation.definition.string.end invalid.illegal.stray-closing-binary
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
<%=[a: :a]%>[]
#            ^ punctuation.section.access.end
#           ^ punctuation.section.access.begin
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

 & 1/&1
#     ^ -punctuation.definition.capture constant.other.capture
#    ^ punctuation.definition.capture constant.other.capture
#   ^ keyword.operator.arithmetic
#  ^ -punctuation.definition.capture constant.other.capture
# ^ -punctuation.definition.capture -constant.other.capture
#^ punctuation.definition.capture constant.other.capture

 & &1..&2; & &1 .. &2
#                  ^^ constant.other.capture
#            ^^ constant.other.capture
#      ^^ constant.other.capture
#    ^^ keyword.operator.range
#  ^^ constant.other.capture

 & &1/2
#    ^ -punctuation.accessor.arity
#  ^^ constant.other.capture

 &:erlang.apply/2
#              ^ punctuation.accessor.arity
#         ^^^^^ variable.other.capture
#        ^ punctuation.accessor.dot
# ^^^^^^^ constant.other.symbol
 &:erlang/2
#         ^ constant.numeric.integer
#        ^ keyword.operator -punctuation.accessor.arity

 &x.(&1)
#      ^ punctuation.section.arguments.end
#    ^^ constant.other.capture
#   ^ punctuation.section.arguments.begin
#  ^ punctuation.accessor.dot
# ^ variable.other
 & &1.(args)
#          ^ punctuation.section.arguments.end
#     ^ punctuation.section.arguments.begin
#    ^ punctuation.accessor.dot
#  ^^ constant.other.capture
 & &1.prop; & &1 .prop
#                 ^^^^ variable.other.member
#                ^ punctuation.accessor.dot
#             ^^ constant.other.capture
#     ^^^^ variable.other.member
#    ^ punctuation.accessor.dot
#  ^^ constant.other.capture

 &<%= num %>
#          ^ keyword.operator.comparison
#     ^^^ variable.other
# ^ keyword.operator.comparison
#^ keyword.operator.capture

 & 0.1
#  ^^^ constant.numeric.float
 &func/0.1
#      ^^^ constant.numeric.float
#     ^ keyword.operator.arithmetic
# ^^^^ variable.other

 & 0<=&1and&1<=255
#              ^^^ constant.numeric
#            ^^ keyword.operator.comparison
#          ^^ constant.other.capture
#       ^^^ keyword.operator.logical
#     ^^ constant.other.capture
#   ^^ keyword.operator.comparison
#  ^ constant.other.capture -constant.numeric
#^ constant.other.capture

 &mod.&/1; &Mod.&/1
#               ^ variable.other.capture
#     ^ variable.other.capture
 &mod.flatten/1
#     ^^^^^^^ variable.other.capture
#    ^ punctuation.accessor.dot
# ^^^ variable.other

 &x."a func"
#   ^^^^^^^^ meta.member
#  ^ punctuation.accessor.dot
# ^ variable.other

 &x.//2
#    ^ punctuation.accessor.arity
#   ^ variable.other.capture
#  ^ punctuation.accessor.dot
# ^ variable.other
 &a:/2
# ^^ constant.other.keyword
    ^ keyword.operator.arithmetic

 (&) [&] {&} %{&} <%= & %>
#               ^ punctuation.section.mapping.end
#             ^ punctuation.section.mapping.begin
#          ^ punctuation.section.sequence.end
#        ^ punctuation.section.sequence.begin
#      ^ punctuation.section.brackets.end
#    ^ punctuation.section.brackets.begin
#  ^ punctuation.section.group.end
#^ punctuation.section.group.begin
 (&x.) [&x.] {&x.} %{&x.} <%= &x. %>
#                       ^ punctuation.section.mapping.end
#                   ^ punctuation.section.mapping.begin
#                ^ punctuation.section.sequence.end
#            ^ punctuation.section.sequence.begin
#          ^ punctuation.section.brackets.end
#      ^ punctuation.section.brackets.begin
#    ^ punctuation.section.group.end
#^ punctuation.section.group.begin

 &Mod."arbitrary function name"/0
#                              ^ punctuation.accessor.arity
#      ^^^^^^^^^^^^^^^^^^^^^^^ variable.other.capture
# ^^^ constant.other.module
 &Mod.'arbitrary function name'/0
#                              ^ punctuation.accessor.arity
#      ^^^^^^^^^^^^^^^^^^^^^^^ variable.other.capture
# ^^^ constant.other.module

 &x.fn/2; &x.do/2; &x.end/2; &x.else/2; &x.after/2; &x.rescue/2; &x.catch/2
#                                                                   ^^^^^ variable.other.capture
#                                                      ^^^^^^ variable.other.capture
#                                          ^^^^^ variable.other.capture
#                               ^^^^ variable.other.capture
#                     ^^^ variable.other.capture
#            ^^ variable.other.capture
#   ^^ variable.other.capture

 &M.fn/2; &M.do/2; &M.end/2; &M.else/2; &M.after/2; &M.rescue/2; &M.catch/2
#                                                                   ^^^^^ variable.other.capture
#                                                      ^^^^^^ variable.other.capture
#                                          ^^^^^ variable.other.capture
#                               ^^^^ variable.other.capture
#                     ^^^ variable.other.capture
#            ^^ variable.other.capture
#   ^^ variable.other.capture

 &fn/2 end; &do/2; &end/2; &else/2; &after/2; &rescue/2; &catch/2
#                                                         ^^^^^ -variable.other.capture
#                                              ^^^^^^ -variable.other.capture
#                                    ^^^^^ -variable.other.capture
#                           ^^^^ -variable.other.capture
#                   ^^^ -variable.other.capture
#            ^^ -variable.other.capture
# ^^^^^^^^ -variable.other.capture

 &=~/2; &=/2; &==/2; &===/2; &!/1; &!=/2; &!==/2; &<<</2; &>>>/2
#                                                          ^^^ variable.other.capture
#                                                  ^^^ variable.other.capture
#                                          ^^^ variable.other.capture
#                                   ^^ variable.other.capture
#                             ^ variable.other.capture
#                     ^^^ variable.other.capture
#              ^^ variable.other.capture
#        ^ variable.other.capture
# ^^ variable.other.capture
 &~~~/2; &::/2; &<~>/2; &<~/2; &<<~/2; &~>/2; &~>>/2; &|>/2; &<|>/2
#                                                             ^^^ variable.other.capture
#                                                      ^^ variable.other.capture
#                                              ^^^ variable.other.capture
#                                       ^^ variable.other.capture
#                               ^^^ variable.other.capture
#                        ^^ variable.other.capture
#                ^^^ variable.other.capture
#         ^^ variable.other.capture
# ^^^ variable.other.capture
 &//2; &\\/2; &*/2; &../2; &.../2; &<=/2; &>=/2; &---/2; &-/2; &</2
#                                                               ^ variable.other.capture
#                                                         ^ variable.other.capture
#                                                 ^^^ variable.other.capture
#                                          ^^ variable.other.capture
#                                   ^^ variable.other.capture
#                           ^^^ variable.other.capture
#                    ^^ variable.other.capture
#              ^ variable.other.capture
#       ^^ variable.other.capture
# ^ variable.other.capture
 &<>/2; &<-/2; &->/2; &--/2; &>/2; & &/1; & &&/2; & &&&/2; &+/2; &++/2
#                                                                 ^^ variable.other.capture
#                                                           ^ variable.other.capture
#                                                   ^^^ variable.other.capture
#                                           ^^ variable.other.capture
#                                    ^ variable.other.capture
#                             ^ variable.other.capture
#                      ^^ variable.other.capture
#               ^^ variable.other.capture
#        ^^ variable.other.capture
# ^^ variable.other.capture
 &+++/2; &|/2; &||/2; &|||/2; &@/1; &^/1; &^^^/2
#                                          ^^^ variable.other.capture
#                                    ^ variable.other.capture
#                              ^ variable.other.capture
#                      ^^^ variable.other.capture
#               ^^ variable.other.capture
#         ^ variable.other.capture
# ^^^ variable.other.capture

 &&/1; &&&/2; &&&&/2; &;/2; &./2; &^^/2
#                                  ^^ -variable.other.capture
#                            ^ -variable.other.capture
#                      ^ -variable.other.capture
#              ^^^ -variable.other.capture
#       ^^ -variable.other.capture
# ^ -variable.other.capture

# The tuple function is rather an exception and normally used only in alias expressions.
 &{}/1; &Kernel.{}/1
#                 ^ punctuation.accessor.arity
#               ^^ variable.other.capture
#   ^ punctuation.accessor.arity
# ^^ variable.other.capture

 &"=/="/2
#       ^ constant.numeric.arity
#      ^ punctuation.accessor.arity
#     ^ punctuation.definition.constant.end
#  ^^^ variable.other.capture
# ^ punctuation.definition.constant.begin
 &"=:="/2
#       ^ constant.numeric.arity
#      ^ punctuation.accessor.arity
#     ^ punctuation.definition.constant.end
#  ^^^ variable.other.capture
# ^ punctuation.definition.constant.begin
 &"=<"/2
#      ^ constant.numeric.arity
#     ^ punctuation.accessor.arity
#    ^ punctuation.definition.constant.end
#  ^^ variable.other.capture
# ^ punctuation.definition.constant.begin

 &true/2; &false/2; &nil/2
#                       ^ -punctuation.accessor.arity
#                    ^^^ constant.language -variable.other.capture
#               ^ -punctuation.accessor.arity
#          ^^^^^ constant.language -variable.other.capture
#     ^ -punctuation.accessor.arity
# ^^^^ constant.language -variable.other.capture
 &M.true/2; &M.false/2; &M.nil/2
#                          ^^^ variable.other.capture -constant.language
#              ^^^^^ variable.other.capture -constant.language
#   ^^^^ variable.other.capture -constant.language

 &when/2; &and/2; &in/2; &or/2; &not/1
#                                ^^^ variable.other.capture
#                         ^^ variable.other.capture
#                  ^^ variable.other.capture
#          ^^^ variable.other.capture
# ^^^^ variable.other.capture

 &if/2; &unless/2; &case/2; &cond/1; &with/2; &for/2
#                                              ^^^ variable.other.capture
#                                     ^^^^ variable.other.capture
#                            ^^^^ variable.other.capture
#                   ^^^^ variable.other.capture
#        ^^^^^^ variable.other.capture
# ^^ variable.other.capture
 &quote/1; &unquote/1; &unquote_splicing/1; &def/2; &defp/2
#                                                    ^^^^ variable.other.capture
#                                            ^^^ variable.other.capture
#                       ^^^^^^^^^^^^^^^^ variable.other.capture
#           ^^^^^^^ variable.other.capture
# ^^^^^ variable.other.capture
 &defimpl/2; &defguard/1; &defguardp/1; &defmacro/2; &defmacrop/2
#                                                     ^^^^^^^^^ variable.other.capture
#                                        ^^^^^^^^ variable.other.capture
#                          ^^^^^^^^^ variable.other.capture
#             ^^^^^^^^ variable.other.capture
# ^^^^^^^ variable.other.capture
 &defcallback/2; &defmacrocallback/2; &defmodule/2; &defstruct/1
#                                                    ^^^^^^^^^ variable.other.capture
#                                      ^^^^^^^^^ variable.other.capture
#                 ^^^^^^^^^^^^^^^^ variable.other.capture
# ^^^^^^^^^^^ variable.other.capture
 &defrecord/1; &defrecordp/1; &defdelegate/2; &defprotocol/2
#                                              ^^^^^^^^^^^ variable.other.capture
#                              ^^^^^^^^^^^ variable.other.capture
#               ^^^^^^^^^^ variable.other.capture
# ^^^^^^^^^ variable.other.capture
 &defexception/1; &defoverridable/1; &import/1; &require/1; &use/1
#                                                            ^^^ variable.other.capture
#                                                ^^^^^^^ variable.other.capture
#                                     ^^^^^^ variable.other.capture
#                  ^^^^^^^^^^^^^^ variable.other.capture
# ^^^^^^^^^^^^ variable.other.capture
 &receive/1; &try/1; &raise/1; &reraise/1; &throw/1; &exit/1; &super/1
#                                                              ^^^^^ variable.other.capture
#                                                     ^^^^ variable.other.capture
#                                           ^^^^^ variable.other.capture
#                               ^^^^^^^ variable.other.capture
#                     ^^^^^ variable.other.capture
#             ^^^ variable.other.capture
# ^^^^^^^ variable.other.capture

 &Module |> func(&1)
#           ^^^^ variable.function
#        ^^ keyword.operator.pipe -punctuation.accessor.arity
# ^^^^^^ constant.other.module
 &Module.Sub |> func(&1)
#               ^^^^ variable.function
#            ^^ keyword.operator.pipe -punctuation.accessor.arity
#        ^^^ constant.other.module
#       ^ punctuation.accessor.dot
# ^^^^^^ constant.other.module

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

 &__MODULE__.func/0; &__MODULE__/0; &mod.__MODULE__/0; &Mod.__MODULE__/0
#                                                                     ^ punctuation.accessor.arity
#                                                           ^^^^^^^^^^ variable.other.capture -variable.language.special-form
#                                                          ^ punctuation.accessor.dot
#                                                       ^^^ constant.other.module
#                                                  ^ punctuation.accessor.arity
#                                        ^^^^^^^^^^ variable.other.capture -variable.language.special-form
#                                       ^ punctuation.accessor.dot
#                                    ^^^ variable.other
#                               ^ punctuation.accessor.arity
#                     ^^^^^^^^^^ variable.other.capture -variable.language.special-form
#                    ^ keyword.operator.capture
#            ^^^^ variable.other.capture
#           ^ punctuation.accessor.dot
# ^^^^^^^^^^ variable.language.special-form

 &quote/2; &unquote/1
#           ^^^^^^^ variable.other.capture
# ^^^^^ variable.other.capture
 &unquote(:apply)/2
#                ^ punctuation.accessor.arity
 &:erlang.unquote(:apply)/2
#                        ^ punctuation.accessor.arity
 &unquote(:erlang).apply/2
#                       ^ punctuation.accessor.arity

# Semantically invalid, but it complicates the rules to do it correctly:
 &./2
   ^ variable.other.member -punctuation.accessor.arity
  ^ punctuation.accessor.dot

 &0; &000
#    ^ punctuation.definition.capture constant.other.capture
#^ punctuation.definition.capture constant.other.capture


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
#^^ keyword.other.fn
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


## Invalid commas

, do end
#<- invalid.illegal.separator
, end
#<- invalid.illegal.separator
, else
#<- invalid.illegal.separator
, after
#<- invalid.illegal.separator
, rescue
#<- invalid.illegal.separator
, catch
#<- invalid.illegal.separator
, when
#<- invalid.illegal.separator
, ;
#<- invalid.illegal.separator
, %>
#<- invalid.illegal.separator

[a,] [b,,] {c,} {c,,} (d,) (e,,) <<"",>> <<"",,>>
#                                            ^^ invalid.illegal.separator
#                                    ^ punctuation.separator.sequence
#                            ^^ invalid.illegal.separator
#                       ^ invalid.illegal.separator
#                 ^^ invalid.illegal.separator
#            ^ punctuation.separator.sequence
#      ^^ invalid.illegal.separator
# ^ punctuation.separator.sequence

assert x,
, "msg"
#<- invalid.illegal.separator

fn a,,b -> end
#   ^^ invalid.illegal.separator


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
#           ^ invalid.illegal.stray-closing-parenthesis
#   ^ punctuation.section.group.begin
<%= [ %> <% ] %>
#           ^ invalid.illegal.stray-closing-bracket
#   ^ punctuation.section.brackets.begin
<%= { %> <% } %>
#           ^ invalid.illegal.stray-closing-brace
#   ^ punctuation.section.sequence.begin
<%= %{ %> <% } %>
#            ^ invalid.illegal.stray-closing-brace
#    ^ punctuation.section.mapping.begin
<%= << %> <% >> %>
#            ^^ invalid.illegal.stray-closing-binary
#   ^^ punctuation.definition.string.begin
