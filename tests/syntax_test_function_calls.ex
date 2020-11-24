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
#  ^^^^^^ variable.function.elixir

raise ArgumentError, "msg"
#                         ^ punctuation.section.arguments.end
#    ^ punctuation.section.arguments.begin

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
#                             ^ punctuation.section.parens.end
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
