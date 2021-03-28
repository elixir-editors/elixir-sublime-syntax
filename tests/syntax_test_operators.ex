# SYNTAX TEST "Elixir.sublime-syntax"

## Operators:

[[l | r], l \\ r, l |> r, l -> r, l <- r, l => r, l .. r, l ++ r, l -- r, l <> r]
#                                                                              ^ variable.other
#                                                                           ^^ keyword.operator.binary-concat
#                                                                         ^ variable.other
#                                                                      ^ variable.other
#                                                                   ^^ keyword.operator.list-diff
#                                                                 ^ variable.other
#                                                              ^ variable.other
#                                                           ^^ keyword.operator.list-concat
#                                                         ^ variable.other
#                                                      ^ variable.other
#                                                   ^^ keyword.operator.range
#                                                 ^ variable.other
#                                              ^ variable.other
#                                           ^^ keyword.operator.map-pair
#                                         ^ variable.other
#                                      ^ variable.other
#                                   ^^ keyword.operator.arrow
#                                 ^ variable.other
#                              ^ variable.other
#                           ^^ keyword.operator.arrow
#                         ^ variable.other
#                      ^ variable.other
#                   ^^ keyword.operator.pipe
#                 ^ variable.other
#              ^ variable.other
#           ^^ keyword.operator.default
#         ^ variable.other
#   ^ keyword.operator.cons
# ^ variable.other

[l != r, l == r, l !== r, l === r, l <= r, l < r, l >= r, l > r]
#                                                             ^ variable.other
#                                                           ^ keyword.operator.comparison
#                                                         ^ variable.other
#                                                      ^ variable.other
#                                                   ^^ keyword.operator.comparison
#                                                 ^ variable.other
#                                              ^ variable.other
#                                            ^ keyword.operator.comparison
#                                          ^ variable.other
#                                       ^ variable.other
#                                    ^^ keyword.operator.comparison
#                                  ^ variable.other
#                               ^ variable.other
#                           ^^^ keyword.operator.comparison
#                         ^ variable.other
#                      ^ variable.other
#                  ^^^ keyword.operator.comparison
#                ^ variable.other
#             ^ variable.other
#          ^^ keyword.operator.comparison
#        ^ variable.other
#     ^ variable.other
#  ^^ keyword.operator.comparison
#^ variable.other

[l &&& r, l ||| r, l <<< r, l >>> r, l ~~~ r, l ^^^ r]
#                                                   ^ variable.other
#                                               ^^^ keyword.operator.bitwise
#                                             ^ variable.other
#                                          ^ variable.other
#                                      ^^^ keyword.operator.bitwise
#                                    ^ variable.function
#                                 ^ variable.other
#                             ^^^ keyword.operator.bitwise
#                           ^ variable.other
#                        ^ variable.other
#                    ^^^ keyword.operator.bitwise
#                  ^ variable.other
#               ^ variable.other
#           ^^^ keyword.operator.bitwise
#         ^ variable.other
#      ^ variable.other
#  ^^^ keyword.operator.bitwise
#^ variable.other

[l && r, l and r, l || r, l or r, l xor r]
#                                       ^ variable.other
#                              ^ variable.other
#                           ^^ keyword.operator.logical
#                         ^ variable.other
#                      ^ variable.other
#                   ^^ keyword.operator.logical
#                 ^ variable.other
#              ^ variable.other
#          ^^^ keyword.operator.logical
#        ^ variable.other
#     ^ variable.other
#  ^^ keyword.operator.logical
#^ variable.other


[^u, &u/1, @u, l ... r, l =~ r, l <~> r, l <~ r, l <<~ r, l ~> r, l ~>> r, l <|> r]
#                                                                                ^ variable.other
#                                                                            ^^^ keyword.operator.pipe
#                                                                          ^ variable.other
#                                                                       ^ variable.other
#                                                                   ^^^ keyword.operator.pipe
#                                                                 ^ variable.other
#                                                              ^ variable.other
#                                                           ^^ keyword.operator.pipe
#                                                         ^ variable.other
#                                                      ^ variable.other
#                                                  ^^^ keyword.operator.pipe
#                                                ^ variable.other
#                                             ^ variable.other
#                                          ^^ keyword.operator.pipe
#                                        ^ variable.other
#                                     ^ variable.other
#                                 ^^^ keyword.operator.pipe
#                               ^ variable.other
#                            ^ variable.other
#                         ^^ keyword.operator.regex
#                       ^ variable.other
#                    ^ variable.other
#                ^^^ keyword.operator.ellipsis
#              ^ variable.function
#           ^ variable.other
#          ^ keyword.operator.attribute
#       ^ constant.numeric.arity
#      ^ punctuation.accessor.arity
#     ^ variable.other.capture
#    ^ keyword.operator.capture
# ^ variable.other
#^ keyword.operator.pin

[not u, !u, -u, +u, l not in r, l :: r]
#                                    ^ variable.other
#                                 ^^ keyword.operator.colon
#                               ^ variable.other
#                            ^ variable.other
#                         ^^ keyword.operator.logical
#                     ^^^ keyword.operator.logical
#                   ^ variable.other
#                ^ variable.other
#               ^ keyword.operator.arithmetic
#            ^ variable.other
#           ^ keyword.operator.arithmetic
#        ^ variable.other
#       ^ keyword.operator.logical
#    ^ variable.other
#^^^ keyword.operator.logical

[l - r, l + r, l * r, l / r, l // r]
#                                 ^ variable.other
#                              ^^ keyword.operator.arithmetic
#                         ^ variable.other
#                       ^ keyword.operator.arithmetic
#                     ^ variable.other
#                  ^ variable.other
#                ^ keyword.operator.arithmetic
#              ^ variable.other
#           ^ variable.other
#         ^ keyword.operator.arithmetic
#       ^ variable.other
#    ^ variable.other
#  ^ keyword.operator.arithmetic
#^ variable.other

[(l = r), (l; r), l.r]
#                   ^ variable.other
#                  ^ punctuation.accessor.dot
#                 ^ variable.other
#             ^ variable.other
#           ^ keyword.operator.semicolon
#          ^ variable.other
#     ^ variable.other
#   ^ keyword.operator.match
# ^ variable.other

l | r
# ^ keyword.operator.union

l ::::: r
#       ^ variable.other
#    ^^ keyword.operator.colon
# ^^^ constant.other.symbol
#<- variable.function
