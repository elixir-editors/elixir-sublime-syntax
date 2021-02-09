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

func ?:
#      ^ punctuation.section.arguments.end
#   ^ punctuation.section.arguments.begin
func valid?:
#           ^ -punctuation.section.arguments.end
#   ^ punctuation.section.arguments.begin
     bool
#        ^ punctuation.section.arguments.end

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
#<- variable.function
f +r
#<- variable.function
f -r
#<- variable.function
f << >>
#<- variable.function
a <<< b
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
end

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
#                 ^^ keyword.declaration.function
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

with _ <- 0,
#          ^ punctuation.separator.arguments
     {:ok, p} <-
       Repo.insert(cs),
#                     ^ punctuation.separator.arguments
     title =
       p.title,
#             ^ punctuation.separator.arguments
     "T" <> _ <- title do
end

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
