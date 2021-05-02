# SYNTAX TEST "Elixir.sublime-syntax"

## Function calls

f()
#<- variable.function
f ()
#   ^ punctuation.section.arguments.end
#  ^ punctuation.section.group.end
# ^ punctuation.section.group.begin
#^ punctuation.section.arguments.begin
#<- variable.function
f.()
#  ^ punctuation.section.arguments.end
# ^ punctuation.section.arguments.begin
#^ punctuation.accessor.dot
#<- variable.function
f 1, f 2, f 3
#            ^ punctuation.section.arguments.end
#         ^ variable.function
#    ^ variable.function
#<- variable.function

elem x, n
#        ^ punctuation.section.arguments.end
#     ^ punctuation.separator.arguments
#   ^ punctuation.section.arguments.begin
#<- variable.function.built-in
is_atom :a
#         ^ punctuation.section.arguments.end
#      ^ punctuation.section.arguments.begin
#<- variable.function.built-in
non_builtin x
#            ^ punctuation.section.arguments.end
#          ^ punctuation.section.arguments.begin
#<- -variable.function.built-in
assert true
#     ^ punctuation.section.arguments.begin
#<- variable.function
m."quoted" arg
#             ^ punctuation.section.arguments.end
#         ^ punctuation.section.arguments.begin
#  ^^^^^^ variable.function

# First argument is an operator keyword:

(f =~: (f=~:)); (f =: (f=:)); (f ==: (f==:)); (f ===: (f===:)); (f !: (f!:)); (f !=: (f!=:));
#                                                                                     ^^ variable.function
#                                                                              ^ variable.function
#                                                                      ^^^ constant.other.keyword
#                                                                      ^ -variable.function
#                                                                ^ variable.function
#                                                      ^ variable.function
#                                              ^ variable.function
#                                     ^ variable.function
#                              ^ variable.function
#                      ^ variable.function
#                ^ variable.function
#       ^ variable.function
#^ variable.function
(f !==: (f!==:)); (f <<>>: (f<<>>:)); (f <<<: (f<<<:)); (f >>>: (f>>>:)); (f ~~~: (f~~~:));
#                                                                                  ^ variable.function
#                                                                          ^ variable.function
#                                                                ^ variable.function
#                                                        ^ variable.function
#                                              ^ variable.function
#                                      ^ variable.function
#                           ^ variable.function
#                  ^ variable.function
#        ^ variable.function
#^ variable.function
(f <~>: (f<~>:)); (f <~: (f<~:)); (f <<~: (f<<~:)); (f ~>: (f~>:)); (f ~>>: (f~>>:));
#                                                                            ^ variable.function
#                                                                    ^ variable.function
#                                                           ^ variable.function
#                                                    ^ variable.function
#                                          ^ variable.function
#                                  ^ variable.function
#                         ^ variable.function
#                  ^ variable.function
#        ^ variable.function
#^ variable.function
(f |>: (f|>:)); (f <|>: (f<|>:)); (f /: (f/:)); (f \\: (f\\:)); (f *: (f*:)); (f ..: (f..:));
#                                                                                     ^ variable.function
#                                                                              ^ variable.function
#                                                                      ^ variable.function
#                                                                ^ variable.function
#                                                       ^ variable.function
#                                                ^ variable.function
#                                        ^ variable.function
#                                  ^ variable.function
#                        ^ variable.function
#                ^ variable.function
#       ^ variable.function
#^ variable.function
(f ...: (f...:)); (f >=: (f>=:)); (f <=: (f<=:)); (f <: (f<:)); (f <-: (f<-:)); (f <>: (f<>:));
#                                                                                       ^ variable.function
#                                                                                ^ variable.function
#                                                                       ^ variable.function
#                                                                ^ variable.function
#                                                        ^ variable.function
#                                                  ^ variable.function
#                                         ^ variable.function
#                                  ^ variable.function
#                         ^ variable.function
#                  ^ variable.function
#        ^ variable.function
#^ variable.function
(f ->: (f->:)); (f >: (f>:)); (f -: (f-:)); (f --: (f--:)); (f ---: (f---:)); (f +: (f+:));
#                                                                                    ^ variable.function
#                                                                              ^ variable.function
#                                                                    ^ variable.function
#                                                            ^ variable.function
#                                                   ^ variable.function
#                                            ^ variable.function
#                                    ^ variable.function
#                              ^ variable.function
#                      ^ variable.function
#                ^ variable.function
#       ^ variable.function
#^ variable.function
(f ++: (f++:)); (f +++: (f+++:)); (f &: (f&:)); (f &&: (f&&:)); (f &&&: (f&&&:)); (f |: (f|:));
#                                                                                        ^ variable.function
#                                                                                  ^ variable.function
#                                                                        ^ variable.function
#                                                                ^ variable.function
#                                                       ^ variable.function
#                                                ^ variable.function
#                                        ^ variable.function
#                                  ^ variable.function
#                        ^ variable.function
#                ^ variable.function
#       ^ variable.function
#^ variable.function
(f ||: (f||:)); (f |||: (f|||:)); (f @: (f@:)); (f {}: (f{}:)); (f %{}: (f{}:)); (f %: (f%:));
#                                                                                       ^ variable.function
#                                                                                 ^ variable.function
#                                                                        ^ variable.function
#                                                                ^ variable.function
#                                                       ^ variable.function
#                                                ^ variable.function
#                                        ^ -variable.function
#                                  ^ variable.function
#                        ^ variable.function
#                ^ variable.function
#       ^ variable.function
#^ variable.function
(f ^: (f^:)); (f ^^^: (f^^^:)); (f "::": (f"::":))
#                                         ^ variable.function
#                                ^ variable.function
#                      ^ variable.function
#              ^ variable.function
#      ^ variable.function
#^ variable.function

# Exceptions:

(f ?: (f?:)); (f ::: (f:::)); (f :: (f::)); (f **: (f**:)); (f .: (f.:));
#                                                                  ^ -variable.function
#                                                            ^ -variable.function
#                                                   ^ -variable.function
#                                            ^ -variable.function
#                                    ^ -variable.function
#                              ^ -variable.function
#                     ^ variable.function
#              ^ variable.function
#      ^ -variable.function
#^ variable.function
(f ^^: (f^^:)); (f []: (f:[])); (f "[]": (f:"[]")); (f % (f%)); (f %{} (f%{}));
#                                                                       ^ variable.function
#                                                                ^ variable.function
#                                                         ^ variable.function
#                                                    ^ variable.function
#                                         ^ variable.function
#                                ^ variable.function
#                       ^ -variable.function
#                ^ variable.function
#       ^ -variable.function
#^ -variable.function

# Make sure that newlines, comments and spaces are skipped to the next token
# after an atom keyword or an operator:

 do func a + end
#            ^^^ punctuation.section.block.end keyword.context.block.end
#^^ keyword.context.block.do
 (func a + ); [func a + ]; {func a + }; %{func a + }; <<func a + >>;
#                                                                ^^ punctuation.definition.string.end
#                                                  ^ punctuation.section.mapping.end
#                                    ^ punctuation.section.sequence.end
#                       ^ punctuation.section.brackets.end
#          ^ punctuation.section.group.end
func a :: b
#         ^ variable.other
#    ^ variable.other -variable.function
func ~j""
#    ^^ storage.type.string
#    ^^^^ meta.string.elixir
#<- variable.function
 <<func a>>
#        ^^ punctuation.definition.string.end
#       ^ variable.other
func <:
#      ^ -punctuation.section.arguments.end
#    ^^ constant.other.keyword
     :<
#      ^ punctuation.section.arguments.end
#    ^^ constant.other.symbol
func and:
#        ^ -punctuation.section.arguments.end
#    ^^^^ constant.other.keyword
     :and
#        ^ punctuation.section.arguments.end
#    ^^^^ constant.other.symbol
func !:
#      ^ -punctuation.section.arguments.end
     :!
#      ^ punctuation.section.arguments.end
func ?: #
#      ^ punctuation.section.arguments.end
#    ^^ constant.numeric.char
#   ^ punctuation.section.arguments.begin
func x?:
#       ^ -punctuation.section.arguments.end
     :x?
#       ^ punctuation.section.arguments.end
func x@?:
#        ^ -punctuation.section.arguments.end
     :x@?
#        ^ punctuation.section.arguments.end
func valid?:
#           ^ -punctuation.section.arguments.end
#    ^^^^^^^ constant.other.keyword
#   ^ punctuation.section.arguments.begin
     bool
#        ^ punctuation.section.arguments.end
#    ^^^^ variable.other
func a =
#       ^ -punctuation.section.arguments.end
#      ^ keyword.operator.match
#    ^ variable.other
     b
#     ^ punctuation.section.arguments.end
#    ^ variable.other
func a <
#       ^ -punctuation.section.arguments.end
#      ^ keyword.operator.comparison
#    ^ variable.other
     b
#     ^ punctuation.section.arguments.end
#    ^ variable.other
func <<
#      ^ -punctuation.section.arguments.end
#    ^^ punctuation.definition.string.begin
     >>
#      ^ punctuation.section.arguments.end
#    ^^ punctuation.definition.string.end
func a <<<
#         ^ -punctuation.section.arguments.end
#      ^^^ keyword.operator.bitwise
#    ^ variable.other
     b
#     ^ punctuation.section.arguments.end
#    ^ variable.other
func a :::
#         ^ punctuation.section.arguments.end
#      ^^^ constant.other.symbol
#    ^ variable.function
func a ::
#        ^ -punctuation.section.arguments.end
#      ^^ keyword.operator.colon
#    ^ variable.other
     b
#     ^ punctuation.section.arguments.end
#    ^ variable.other
func a..
#       ^ -punctuation.section.arguments.end
     b
#     ^ punctuation.section.arguments.end
func ...
#       ^ punctuation.section.arguments.end
func a when
#          ^ -punctuation.section.arguments.end
#      ^^^^ keyword.operator.when
     b
#     ^ punctuation.section.arguments.end
func a and
#         ^ -punctuation.section.arguments.end
#      ^^^ keyword.operator.logical
     b
#     ^ punctuation.section.arguments.end
func a in
#        ^ -punctuation.section.arguments.end
#      ^^ keyword.operator.logical
     b
#     ^ punctuation.section.arguments.end
func a or
#        ^ -punctuation.section.arguments.end
#      ^^ keyword.operator.logical
     b
#     ^ punctuation.section.arguments.end
func a not
#         ^ -punctuation.section.arguments.end
#      ^^^ keyword.operator.logical
     b
#     ^ punctuation.section.arguments.end

raise ArgumentError, "msg"
#                         ^ punctuation.section.arguments.end
#    ^ punctuation.section.arguments.begin
#<- keyword.control.flow.throw

raise"msg"
#         ^ punctuation.section.arguments.end
#    ^^^^^ string.quoted.double
#<- keyword.control.flow.throw
 raise?me?
#      ^^^ variable.other
#^^^^^^ variable.function


%{} |> Kernel.|> Map.put(:key, :value)
#                                     ^ punctuation.section.arguments.end
#               ^ punctuation.section.arguments.begin
#             ^^ variable.function
#   ^^ keyword.operator.pipe

Kernel.<>(); kernel.<>()
#                   ^^ variable.function
#      ^^ variable.function
kernel.<>
#      ^^ variable.other.member -variable.function

 Mod.{} map.{}
#           ^^ variable.other.member
#    ^^ variable.function

 Mod.fun(); Mod.fun.(); mod.fun.()
#                                ^ punctuation.section.arguments.end
#                               ^ punctuation.section.arguments.begin
#                              ^ punctuation.accessor.dot
#                           ^^^ variable.function
#                          ^ punctuation.accessor.dot
#                  ^ punctuation.accessor.dot
#               ^^^ variable.function
#              ^ punctuation.accessor.dot
#    ^^^ variable.function
#   ^ punctuation.accessor.dot

 Module.a.b.c.d()
#             ^ variable.function
#           ^ variable.other.member
#         ^ variable.other.member
#       ^ variable.function

(&String.starts_with?/2).("a", "a")
#                                 ^ punctuation.section.arguments.end
#                            ^ punctuation.separator.arguments
#                        ^^^^^^^^^^ meta.function-call.arguments
#                        ^ punctuation.section.arguments.begin
#                       ^ punctuation.accessor.dot

f &r
# ^ keyword.operator.capture
#<- variable.function
f &&r
# ^^ keyword.operator.logical
#<- -variable.function
f +r
# ^ keyword.operator.arithmetic
#<- variable.function
f -r
# ^ keyword.operator.arithmetic
#<- variable.function
f << >>
# ^^ punctuation.definition.string.begin
#<- variable.function
a <<< b
# ^^^ keyword.operator.bitwise
#<- variable.other -variable.function

 a+x
#^ variable.other
 a-x
#^ variable.other
 f +x
#^ variable.function
 f -x
#^ variable.function
x ++ y; x++y; x++y
#             ^ variable.other -variable.function
#       ^ variable.other -variable.function
#<- variable.other -variable.function

 assert not Enum.all?(list, & &1)
#                                ^ punctuation.section.arguments.end
#       ^^^ keyword.operator.logical
#      ^ punctuation.section.arguments.begin
#^^^^^^ variable.function

case A.func do
#      ^^^^ variable.function
end

case a.func do
#      ^^^^ -variable.function
  {:ok, value} when value != [] -> value
#                                  ^^^^^ variable.other
#                               ^^ keyword.operator.arrow
#                         ^^ keyword.operator.comparison
#                   ^^^^^ variable.other
#              ^^^^ keyword.operator.when
#       ^^^^^ variable.parameter
  {:error, e} ->
#          ^ variable.parameter
    e
#   ^ variable.other -variable.parameter
end

case unquote(value) do
  unquote(arrow_clauses(clauses))
#                       ^^^^^^^ variable.other -variable.parameter
# ^^^^^^^ keyword.other.unquote
end

# TODO: highlight x as a parameter?
case(value, do: (x -> x; y -> y))
#                                ^ -punctuation.section.arguments.end
#                               ^ punctuation.section.arguments.end
#                              ^ punctuation.section.group.end
#                      ^ keyword.operator.semicolon
#                     ^ variable.other
#                  ^^ keyword.operator.arrow
#                ^ variable.other
#               ^ punctuation.section.group.begin
#           ^^^ constant.other.keyword
#         ^ punctuation.separator.arguments
#    ^^^^^ variable.other
#   ^ punctuation.section.arguments.begin
#<- keyword.control.conditional


 with {:ok, struct} = ok <- Repo.insert() do
#                     ^^ variable.parameter
#           ^^^^^^ variable.parameter
#    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.function-call.arguments
#^^^^ keyword.control.conditional
   struct
#  ^^^^^^ variable.other -variable.parameter
 else
   {:error, e} -> e
   #              ^ variable.other -variable.parameter
   #        ^ variable.parameter
 end
#   ^ punctuation.section.arguments.end

with do
#    ^^ keyword.context.block.do
else
  e -> e
# ^ variable.parameter
end
#  ^ punctuation.section.arguments.end

with {:ok, fst} <-
#               ^^ keyword.operator.arrow
#          ^^^ variable.parameter
       f1(),
#          ^ punctuation.separator.arguments
#      ^^ variable.function
     {:ok, snd} <-
#               ^^ keyword.operator.arrow
#          ^^^ variable.parameter
       f2() do
#           ^^ keyword.context.block.do
#      ^^ variable.function
end

with unquote(clauses) do
#            ^^^^^^^ variable.other
#    ^^^^^^^ keyword.other.unquote
end
#  ^ punctuation.section.arguments.end

with some do
#    ^^^^ variable.parameter
end
#  ^ punctuation.section.arguments.end
with some < do
#         ^ keyword.operator.comparison
#    ^^^^ variable.other
end
#  ^ punctuation.section.arguments.end
with some <- thing do
#            ^^^^^ variable.other -variable.parameter
#    ^^^^ variable.parameter
end
#  ^ punctuation.section.arguments.end

with _ <- 0,
#          ^ punctuation.separator.arguments
#      ^^ keyword.operator.arrow
#    ^ variable.parameter.unused
     {:ok, p} <-
#          ^ variable.parameter
       Repo.insert(cs),
#                     ^ punctuation.separator.arguments
#                  ^^ variable.other
     title =
#          ^ keyword.operator.match
#    ^^^^^ variable.parameter
       p.title,
#             ^ punctuation.separator.arguments
     "T" <> _ <- title do
#                ^^^^^ variable.other
#           ^ variable.parameter.unused
end
#  ^ punctuation.section.arguments.end

with {:ok, x} <- f(), do: x
#                          ^ punctuation.section.arguments.end
#                         ^ variable.other -variable.parameter
#                     ^^^ constant.other.keyword.elixir
#                   ^ punctuation.separator.arguments
#          ^ variable.parameter

 try do
#    ^^ keyword.context.block.do
#^^^ keyword.control.exception.try
   no_param
#  ^^^^^^^^ -variable.parameter
   do_something_that_may_fail(some_arg)
 rescue
#^^^^^^ keyword.control.exception.catch
   ArgumentError = e ->
#                  ^ variable.parameter
#  ^^^^^^^^^^^^^ constant.other.module
     IO.puts("Invalid #{inspect(e)} given")
 catch
#^^^^^ keyword.control.exception.catch
   value ->
#  ^^^^^ variable.parameter
     IO.puts("Caught #{inspect(value)}")
 else
#^^^^ keyword.control.conditional.else
   value ->
#  ^^^^^ variable.parameter
     IO.puts("Success! The result was #{inspect(value)}")
 after
   no_param
#  ^^^^^^^^ -variable.parameter
   IO.puts("This is printed regardless if it failed or succeeded")
 end
#   ^ punctuation.section.arguments.end
#^^^ keyword.context.block.end

 try do: 1/x, after: IO.puts("Division by 0!")
#                                             ^ punctuation.section.arguments.end
#             ^^^^^^ constant.other.keyword
#           ^ punctuation.separator.arguments
#          ^ variable.other
#    ^^^ constant.other.keyword

for n <- [1, 2, 3, 4], do: n * 2
#                               ^ punctuation.section.arguments.end
#                          ^ variable.other
#   ^ variable.parameter
for x <- [1, 2], y <- [2, 3], do: x * y
#                                      ^ punctuation.section.arguments.end
#                                 ^ variable.other
#   ^ variable.parameter
for n <- [1, 2, 3, 4, 5, 6], rem(n, 2) == 0, do: n
#                                                 ^ punctuation.section.arguments.end
#                                                ^ variable.other
#                                ^ variable.other
#   ^ variable.parameter
for {type, name} when type != :guest <- users do String.upcase(name) end
#                                                                       ^ punctuation.section.arguments.end
#                                       ^^^^^ variable.other
#                     ^^^^ variable.other
#    ^^^^ variable.parameter
for <<r::8, g::8, b::8 <- pixels >>, do: {r, g, b}
#                                                 ^ punctuation.section.arguments.end
#                                         ^ variable.other
#                         ^^^^^^ variable.other
#                 ^ variable.parameter
#           ^ variable.parameter
#     ^ variable.parameter
for <<c <- " hello world ">>, c != ?\s, into: "", do: <<c>>
#                                                       ^ variable.other
#                             ^ variable.other
#     ^ variable.parameter
  TODO:                                                    ^ punctuation.section.arguments.end
for line <- IO.stream(:stdio, :line), into: IO.stream(:stdio, :line) do
#   ^^^^ variable.parameter
   String.upcase(line)
   no_param -> :ok
#  ^^^^^^^^ variable.other -variable.parameter
end
#  ^ punctuation.section.arguments.end
for x <- [1, 1, 2, 3], uniq: true, do: x * 2
#                                           ^ punctuation.section.arguments.end
#                                      ^ variable.other
#   ^ variable.parameter
for <<x <- "abcabc">>, uniq: true, into: "", do: <<x - 32>>
#                                                  ^ variable.other
#     ^ variable.parameter
  TODO:                                                    ^ punctuation.section.arguments.end
for <<x <- "AbCabCABc">>, x in ?a..?z, do: <<x>>
#                                            ^ variable.other
#                         ^ variable.other
#     ^ variable.parameter
  TODO:                                         ^ punctuation.section.arguments.end
for <<x <- "AbCabCABc">>, x in ?a..?z, reduce: %{} do
#                                                  ^^ keyword.context.block.do
#                         ^ variable.other
#     ^ variable.parameter
  acc -> Map.update(acc, <<x>>, 1, & &1 + 1)
#                          ^ variable.other
#                   ^^^ variable.other
# ^^^ variable.parameter
end
#  ^ punctuation.section.arguments.end


 receive do
#        ^^ keyword.context.block.do
#^^^^^^^ keyword.control.loop.receive
   {:selector, number, name} when is_integer(number) ->
#                                            ^^^^^^ variable.other -variable.parameter
#                            ^^^^ keyword.operator.when
#                      ^^^^ variable.parameter
#              ^^^^^^ variable.parameter
     name
#    ^^^^ variable.other -variable.parameter
   name when is_atom(name) ->
#                    ^^^^ variable.other -variable.parameter
#       ^^^^ keyword.operator.when
#  ^^^^ variable.parameter
     name
#    ^^^^ variable.other -variable.parameter
   _ ->
#  ^ variable.parameter.unused
     IO.puts(:stderr, "Unexpected message received")
 end
#   ^ punctuation.section.arguments.end
#^^^ keyword.context.block.end

 receive do ^ref ->
#                ^^ keyword.operator.arrow
#            ^^^ variable.other -variable.parameter
#           ^ keyword.operator.pin
   ref
#  ^^^ variable.other -variable.parameter
 end

 receive do
   ^ref -> :ok
#       ^^ keyword.operator.arrow
#   ^^^ variable.other -variable.parameter
#  ^ keyword.operator.pin
   {:DOWN, ^ref, _, _, _} -> :DOWN
#                      ^ variable.parameter.unused
#                   ^ variable.parameter.unused
#                ^ variable.parameter.unused
#           ^^^ variable.other -variable.parameter
 after
#^^^^^ keyword.control.exception.catch
   _timeout = 5_000 ->
#             ^^^^^ constant.numeric.integer
#           ^ keyword.operator.match
#  ^^^^^^^^ variable.parameter.unused
     IO.puts(:stderr, "No message in 5 seconds")
 end
#   ^ punctuation.section.arguments.end
#^^^ keyword.context.block.end

 receive after: (timeout -> :ok)
#                               ^ punctuation.section.arguments.end
#                ^^^^^^^ variable
#        ^^^^^^ constant.other.keyword
 receive do: (^ref -> :ok), after: (timeout -> :ok)
#                                                  ^ punctuation.section.arguments.end
#                                   ^^^^^^^ variable
#                           ^^^^^^ constant.other.keyword
#                         ^ punctuation.separator.arguments
#              ^^^ variable
#        ^^^ constant.other.keyword


# Avoid matching keywords as an identifier before "do":
f x __MODULE__ do end; f x __ENV__ do end
#                          ^^^^^^^ variable.language.special-form
#   ^^^^^^^^^^ variable.language.special-form
f x nil do end; f x true do end; f x false do end
#                                    ^^^^^ constant.language
#                   ^^^^ constant.language
#   ^^^ constant.language
f x when do end; f x and do end; f x in do end
#                                    ^^ keyword.operator.logical
#                    ^^^ keyword.operator.logical
#   ^^^^ keyword.operator.when
f x or do end; f x not do end; f x else do end
#                                  ^^^^ keyword.control.conditional.else
#                  ^^^ keyword.operator.logical
#   ^^ keyword.operator.logical
f x after do end; f x rescue do end; f x catch do end
#                                        ^^^^^ keyword.control.exception.catch
#                     ^^^^^^ keyword.control.exception.catch
#   ^^^^^ keyword.control.exception.catch
f x end do end; f fn end
#                 ^^ keyword.other.fn
#   ^^^ keyword.context.block.end
f x do: do end; f x end: do end; f fn: end
#                                  ^^^ constant.other.keyword
#                   ^^^^ constant.other.keyword
#   ^^^ constant.other.keyword

func x do do end end
#                ^^^ punctuation.section.block.end keyword.context.block.end
#            ^^^ punctuation.section.block.end keyword.context.block.end
#         ^^ punctuation.section.block.begin keyword.context.block.do
#      ^^ punctuation.section.block.begin keyword.context.block.do
#    ^ variable.other
func x . do do end
#              ^^^ punctuation.section.block.end keyword.context.block.end
#           ^^ punctuation.section.block.begin keyword.context.block.do
#        ^^ variable.other.member
#      ^ punctuation.accessor.dot
#    ^ variable.other

start(fn -> raise "stop"  end)
#                            ^ punctuation.section.arguments.end
#                         ^^^ punctuation.section.block.end
#                        ^ -punctuation.section.arguments.end
#                       ^ punctuation.section.arguments.end
#                ^ punctuation.section.arguments.begin
#     ^^ punctuation.section.block.begin

"#{inspect error}"
#               ^ punctuation.section.interpolation.end
#          ^^^^^ variable.other
#  ^^^^^^^ variable.function
#^^ punctuation.section.interpolation.begin
(from p in q, select: p.title )
#                             ^ punctuation.section.group.end
#                            ^ punctuation.section.arguments.end
#^^^^ variable.function

 cond cond do
#     ^^^^ variable.other
#^^^^ keyword.control
 cond -> cond
#        ^^^^ variable.other
#^^^^ variable.other
 x.cond -> cond.x
#              ^ punctuation.accessor.dot
#          ^^^^ variable.other
#  ^^^^ variable.other.member
# ^ punctuation.accessor.dot
end
#  ^ punctuation.section.arguments.end
#<- punctuation.section.block.end

quote(do: (acc, x -> x))
#             ^ punctuation.separator.sequence
quote(do: (1, 2, 3 when 4 when 5 -> 6))
#              ^ punctuation.separator.sequence
#           ^ punctuation.separator.sequence


## Built-ins

 is_atom(x)
#       ^ punctuation.section.arguments.begin
#^^^^^^^ variable.function.built-in
 is_binary(x)
#         ^ punctuation.section.arguments.begin
#^^^^^^^^^ variable.function.built-in
 is_bitstring(x)
#            ^ punctuation.section.arguments.begin
#^^^^^^^^^^^^ variable.function.built-in
 is_boolean(x)
#          ^ punctuation.section.arguments.begin
#^^^^^^^^^^ variable.function.built-in
 is_exception(x)
#            ^ punctuation.section.arguments.begin
#^^^^^^^^^^^^ variable.function.built-in
 is_float(x)
#        ^ punctuation.section.arguments.begin
#^^^^^^^^ variable.function.built-in
 is_function(x)
#           ^ punctuation.section.arguments.begin
#^^^^^^^^^^^ variable.function.built-in
 is_integer(x)
#          ^ punctuation.section.arguments.begin
#^^^^^^^^^^ variable.function.built-in
 is_list(x)
#       ^ punctuation.section.arguments.begin
#^^^^^^^ variable.function.built-in
 is_map(x)
#      ^ punctuation.section.arguments.begin
#^^^^^^ variable.function.built-in
 is_map_key(x)
#          ^ punctuation.section.arguments.begin
#^^^^^^^^^^ variable.function.built-in
 is_nil(x)
#      ^ punctuation.section.arguments.begin
#^^^^^^ variable.function.built-in
 is_number(x)
#         ^ punctuation.section.arguments.begin
#^^^^^^^^^ variable.function.built-in
 is_pid(x)
#      ^ punctuation.section.arguments.begin
#^^^^^^ variable.function.built-in
 is_port(x)
#       ^ punctuation.section.arguments.begin
#^^^^^^^ variable.function.built-in
 is_reference(x)
#            ^ punctuation.section.arguments.begin
#^^^^^^^^^^^^ variable.function.built-in
 is_struct(x)
#         ^ punctuation.section.arguments.begin
#^^^^^^^^^ variable.function.built-in
 is_tuple(x)
#        ^ punctuation.section.arguments.begin
#^^^^^^^^ variable.function.built-in


 abs(x)
#   ^ punctuation.section.arguments.begin
#^^^ variable.function.built-in
 apply(x)
#^^^^^ variable.function.built-in
 binary_part(x)
#^^^^^^^^^^^ variable.function.built-in
 bit_size(x)
#^^^^^^^^ variable.function.built-in
 byte_size(x)
#^^^^^^^^^ variable.function.built-in
 ceil(x)
#^^^^ variable.function.built-in
 div(x)
#^^^ variable.function.built-in
 elem(x)
#^^^^ variable.function.built-in
 exit(x)
#^^^^ keyword.control.flow.exit
 floor(x)
#^^^^^ variable.function.built-in
 function_exported(x)
#^^^^^^^^^^^^^^^^^ -variable.function.built-in
 function_exported?(x)
#^^^^^^^^^^^^^^^^^^ variable.function.built-in
 get_in(x)
#^^^^^^ variable.function.built-in
 get_and_update_in(x)
#^^^^^^^^^^^^^^^^^ variable.function.built-in
 hd(x)
#^^ variable.function.built-in
 inspect(x)
#^^^^^^^ variable.function.built-in
 length(x)
#^^^^^^ variable.function.built-in
 macro_exported(x)
#^^^^^^^^^^^^^^ -variable.function.built-in
 macro_exported?(x)
#^^^^^^^^^^^^^^^ variable.function.built-in
 make_ref(x)
#^^^^^^^^ variable.function.built-in
 map_size(x)
#^^^^^^^^ variable.function.built-in
 max(x)
#^^^ variable.function.built-in
 min(x)
#^^^ variable.function.built-in
 node(x)
#^^^^ variable.function.built-in
 pop_in(x)
#^^^^^^ variable.function.built-in
 put_elem(x)
#^^^^^^^^ variable.function.built-in
 put_in(x)
#^^^^^^ variable.function.built-in
 rem(x)
#^^^ variable.function.built-in
 round(x)
#^^^^^ variable.function.built-in
 self(x)
#^^^^ variable.function.built-in
 send(x)
#^^^^ variable.function.built-in
 spawn(x)
#^^^^^ variable.function.built-in
 spawn_link(x)
#^^^^^^^^^^ variable.function.built-in
 spawn_monitor(x)
#^^^^^^^^^^^^^ variable.function.built-in
 struct(x)
#^^^^^^ variable.function.built-in
 struct!(x)
#^^^^^^^ variable.function.built-in
 struct?(x)
#^^^^^^^ -variable.function.built-in
 sum(x)
#^^^ variable.function.built-in
 tap(x)
#^^^ variable.function.built-in
 then(x)
#^^^^ variable.function.built-in
 throw(x)
#^^^^^ keyword.control.flow.throw
 tl(x)
#^^ variable.function.built-in
 trunc(x)
#^^^^^ variable.function.built-in
 tuple_size(x)
#^^^^^^^^^^ variable.function.built-in
 update_in(x)
#^^^^^^^^^ variable.function.built-in
