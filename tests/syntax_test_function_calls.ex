# SYNTAX TEST "Elixir.sublime-syntax"

## Function calls

f()
#<- variable.function
f ()
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
is_atom :a
#         ^ punctuation.section.arguments.end
#      ^ punctuation.section.arguments.begin
non_builtin x
#            ^ punctuation.section.arguments.end
#          ^ punctuation.section.arguments.begin
assert true
#     ^ punctuation.section.arguments.begin
m."quoted" arg
#             ^ punctuation.section.arguments.end
#         ^ punctuation.section.arguments.begin
#  ^^^^^^ variable.function

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

Kernel.<>(); kernel.<>()
#                   ^^ variable.function
#      ^^ variable.function
kernel.<>
#      ^^ variable.other.member -variable.function

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
 is_record(x)
#         ^ punctuation.section.arguments.begin
#^^^^^^^^^ variable.function.built-in
 is_reference(x)
#            ^ punctuation.section.arguments.begin
#^^^^^^^^^^^^ variable.function.built-in
 is_tuple(x)
#        ^ punctuation.section.arguments.begin
#^^^^^^^^ variable.function.built-in
 is_exception(x)
#            ^ punctuation.section.arguments.begin
#^^^^^^^^^^^^ variable.function.built-in

 abs(x)
#   ^ punctuation.section.arguments.begin
#^^^ variable.function.built-in
 bit_size(x)
#        ^ punctuation.section.arguments.begin
#^^^^^^^^ variable.function.built-in
 byte_size(x)
#         ^ punctuation.section.arguments.begin
#^^^^^^^^^ variable.function.built-in
 div(x)
#   ^ punctuation.section.arguments.begin
#^^^ variable.function.built-in
 elem(x)
#    ^ punctuation.section.arguments.begin
#^^^^ variable.function.built-in
 hd(x)
#  ^ punctuation.section.arguments.begin
#^^ variable.function.built-in
 length(x)
#      ^ punctuation.section.arguments.begin
#^^^^^^ variable.function.built-in
 map_size(x)
#        ^ punctuation.section.arguments.begin
#^^^^^^^^ variable.function.built-in
 node(x)
#    ^ punctuation.section.arguments.begin
#^^^^ variable.function.built-in
 rem(x)
#   ^ punctuation.section.arguments.begin
#^^^ variable.function.built-in
 round(x)
#     ^ punctuation.section.arguments.begin
#^^^^^ variable.function.built-in
 tl(x)
#  ^ punctuation.section.arguments.begin
#^^ variable.function.built-in
 trunc(x)
#     ^ punctuation.section.arguments.begin
#^^^^^ variable.function.built-in
 tuple_size(x)
#          ^ punctuation.section.arguments.begin
#^^^^^^^^^^ variable.function.built-in
