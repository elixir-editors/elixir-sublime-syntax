# SYNTAX TEST "Elixir.sublime-syntax"

 <<>>
#  ^^ punctuation.definition.string.end
#^^ punctuation.definition.string.begin
#^^^^ string.other.binary
#^^^^ meta.string.binary

<<var>>; <<123>>; <<"<<>>">>
#                   ^^^^^^ string.quoted.double
#          ^^^ constant.numeric
# ^^^ variable.other
#<- string.other.binary

<< 1 <<< 2 >>> 3>>
#          ^^^ keyword.operator.bitwise
#    ^^^ keyword.operator.bitwise

<<val::unit(8)-size(2)-integer>>
#                     ^^^^^^^^ storage.type.binary
#             ^^^^^ storage.type.binary
#      ^^^^ storage.type.binary
#      ^^^^^^^^^^^^^^^^^^^^^^^ meta.type.binary

&<<&1, &2>>
#      ^^ constant.other.capture
#  ^^ constant.other.capture
#<- keyword.operator.capture
&<<?`, &1, ?`>>
#<- keyword.operator.capture

<<unquote(x), _::_*unquote(y)>>
#                  ^^^^^^^ keyword.other
# ^^^^^^^ keyword.other
<< x <- bin >>
#       ^^^ variable.other
#    ^^ keyword.operator.arrow
#  ^ variable.other
<< func(x) >>
#       ^ variable.other
#  ^^^^ variable.function

<< <<>> >>
#  ^^^^ string.other.binary
<< <<>><><<>> >>
#        ^^^^ string.other.binary
#      ^^ keyword.operator
#  ^^^^ string.other.binary

<< <<>>::<<>> >>
#        ^^^^ string.other.binary
#      ^^ keyword.operator.colon
#  ^^^^ string.other.binary

 <<1, <<2, 3, 4>>, 5>> = <<1, 2, 3, 4, 5>>
#                        ^^^^^^^^^^^^^^^^^ meta.string.binary
#                      ^ keyword.operator.match
#                   ^^ punctuation.definition.string.end
#              ^^ punctuation.definition.string.end
#        ^ punctuation.separator.sequence
#     ^^ punctuation.definition.string.begin
#   ^ punctuation.separator.sequence
#^^ punctuation.definition.string.begin
#^^^^^^^^^^^^^^^^^^^^^ meta.string.binary

<< ~s<<<>::binary >>
#       ^ punctuation.definition.string.end
#    ^^^^ string.interpolated
#    ^ punctuation.definition.string.begin
<< x <<~ y ~>> z >>
#          ^^^ keyword.operator.pipe
#    ^^^ keyword.operator.pipe

<<"<<", _rest::binary>>
#       ^^^^^ variable.other.unused
# ^^^^ string.quoted.double

<<-1::signed>>
#     ^^^^^^ storage.type.binary
# ^ keyword.operator.arithmetic
#<- string.other.binary

<<1,
#  ^ punctuation.separator.sequence
#<- string.other.binary
,
#<- invalid
,
#<- invalid
>>
#<- string.other.binary

 >>
#^^ invalid
