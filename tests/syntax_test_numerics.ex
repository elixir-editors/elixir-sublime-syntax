# SYNTAX TEST "Elixir.sublime-syntax"

## Numerics

### Integer

 0 1 9
#    ^ constant.numeric.integer
#  ^ constant.numeric.integer
#^ constant.numeric.integer
 000
#^^^ constant.numeric
 0_0
#^^^ constant.numeric
 0_1_2_3
#^^^^^^^ constant.numeric
 0123
#^^^^ constant.numeric

 0__0 0_0__0
#        ^^^ invalid.illegal.numeric
# ^^^ invalid.illegal.numeric

_0
#^ -constant.numeric
_123
#^^^ -constant.numeric


### Float

 0.0 1.23
#    ^^^^ constant.numeric.float
# ^ punctuation.separator.decimal -punctuation.separator.numeric
#^^^ constant.numeric.float

 0.0 0.0e0 0.0e+0 0.0e-0
#                 ^^^^^^ constant.numeric.float
#          ^^^^^^ constant.numeric.float
#    ^^^^^ constant.numeric.float
#^^^ constant.numeric.float

 0.
# ^ punctuation.accessor.dot -constant.numeric
 0._
#  ^ variable.other.member

1..1
#^^ keyword.operator.range
1...
#^^^ keyword.operator.ellipsis

 0e0 0E0 0.0e 0.0E 0.0e_ 0.0E_ 0.0E_0 0.0E0_ 0.0E0_0_ 0.0E0__0
#                                                          ^^^ invalid.illegal.numeric
#                                                   ^ invalid.illegal.numeric
#                                          ^ invalid.illegal.numeric
#                                 ^^^ -constant.numeric
#                           ^^ -constant.numeric
#                     ^^ -constant.numeric
#                ^ -constant.numeric
#           ^ -constant.numeric
#     ^^ -constant.numeric
# ^^ -constant.numeric

 0_0.0
#^^^^^ constant.numeric.float
_123.456
#   ^ -punctuation.separator.decimal
#^^^^^^^ -constant.numeric.float


### Binary

 0b0 0b0_0 0b0_1
#          ^^^^^ constant.numeric
#    ^^^^^ constant.numeric
# ^ punctuation.separator.numeric
#^^^ constant.numeric.binary

 0b 0b_ 0b0_ 0b0_0__0 0b0__0 0b2 0b0_2
#                                   ^^ invalid.illegal.numeric
#                             ^^ -constant.numeric
#                        ^^^ invalid.illegal.numeric
#                 ^^^ invalid.illegal.numeric
#          ^ invalid.illegal.numeric
#    ^^ -constant.numeric
# ^ -constant.numeric

 0b00..0b01
#      ^^^^ constant.numeric
#    ^^ keyword.operator.range
#^^^^ constant.numeric


### Hex

 0x0123456789abcdefABCDEF
# ^ punctuation.separator.numeric
#^^^^^^^^^^^^^^^^^^^^^^^^ constant.numeric.hex
 0x0_1_2_a_b_c_D_E_F
#^^^^^^^^^^^^^^^^^^^ constant.numeric

 0x 0x_ 0x0_ 0x0__0 0xG 0x0_G
#                          ^ invalid.illegal.numeric
#                    ^^ -constant.numeric
#               ^^^ invalid.illegal.numeric
#          ^ invalid.illegal.numeric
#    ^^ -constant.numeric
# ^ -constant.numeric

 0x00..0x01
#      ^^^^ constant.numeric
#    ^^ keyword.operator.range
#^^^^ constant.numeric

### Octal

 0o01234567
# ^ punctuation.separator.numeric
#^^^^^^^^^^ constant.numeric.octal
 0o0 0o0_0 0o1 0o1_2_3
#              ^^^^^^^ constant.numeric
#          ^^^ constant.numeric
#    ^^^^^ constant.numeric
#^^^ constant.numeric

 0o 0o_ 0o0_ 0o8 0o0_8 0o0_7_8
#                           ^^ invalid.illegal.numeric
#                   ^^ invalid.illegal.numeric
#             ^^ -constant.numeric
#          ^ invalid.illegal.numeric
#    ^^ -constant.numeric
# ^ -constant.numeric

 0o00..0o01
#      ^^^^ constant.numeric
#    ^^ keyword.operator.range
#^^^^ constant.numeric


### Character

 ??
#^ punctuation.definition.numeric
#^^ constant.numeric.char

 ?: ?. ?x ?\x ?\\ ?\
#                 ^^^ constant.numeric.char
#             ^^^ constant.numeric.char
#         ^^^ constant.numeric.char
#      ^^ constant.numeric.char
#   ^^ constant.numeric.char
#^^ constant.numeric.char

 ?" ?' ?< ?>
#         ^^ constant.numeric.char
#      ^^ constant.numeric.char
#   ^^ constant.numeric.char
#^^ constant.numeric.char

 ?( ?) ?[ ?] ?{ ?}
#               ^^ constant.numeric.char
#            ^^ constant.numeric.char
#         ^^ constant.numeric.char
#      ^^ constant.numeric.char
#   ^^ constant.numeric.char
#^^ constant.numeric.char

 ?...?.
#    ^^ constant.numeric.char
#  ^^ keyword.operator.range
#^^ constant.numeric.char

 ?  ? ?
#    ^^ invalid.illegal.character-literal
#   ^^ constant.numeric.char
# ^ invalid.illegal.character-literal
#^^ constant.numeric.char
