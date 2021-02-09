# SYNTAX TEST "Elixir.sublime-syntax"

# Strings

 ""
# ^ punctuation.definition.string.end
#^ punctuation.definition.string.begin
#^^ meta.string.elixir string.quoted.double.elixir
 ''
#^^ meta.string.elixir string.quoted.single.elixir
 <<>>
#^^^^ meta.string.binary.elixir string.other.binary.elixir
 """
#^^^ meta.string.elixir string.quoted.triple.double.elixir punctuation.definition.string.begin.elixir
 """
#^^^ punctuation.definition.string.end
#<- meta.string string.quoted.triple.double
 '''
#^^^ meta.string.elixir string.quoted.triple.single.elixir punctuation.definition.string.begin.elixir
 '''
#^^^ punctuation.definition.string.end
#<- meta.string string.quoted.triple.single


## Modifiers

 ""m
#  ^ -string.quoted.modifiers
 ''m
#  ^ -string.quoted.modifiers
 """
 """m
#   ^ -string.quoted.modifiers
 '''
 '''m
#   ^ -string.quoted.modifiers

 ~w""a
#    ^ string.quoted.modifiers storage.type.string

~L""''a
#     ^ -string.quoted.modifiers
~L"""
 \"""
#^^^^^ meta.string.elixir text.html.eex text.html.basic
#^^ -constant.character.escape.char
  """''a
#      ^ -string.quoted.modifiers

 "\""m
#    ^ -string.quoted.modifiers
# ^^ string.quoted.double constant.character.escape.char

 ~w"""
 \
#^^ punctuation.separator.continuation
#
 """s
#   ^ string.quoted.modifiers storage.type.string
#^^^ punctuation.definition.string.end

 ~w{/#{{}}/}a
#          ^ punctuation.definition.string.end
#    ^^^^^ meta.string.elixir meta.interpolation.elixir

 ~s<?~><><<?~>>
#            ^^ punctuation.definition.string.end
#        ^^ punctuation.definition.string.begin
#      ^^ keyword.operator.binary-concat
#^^^^^^ meta.string

 "d#{ {embedded} }d"nomod
#                   ^^^^^ variable.other
#                  ^ punctuation.definition.string.end
#                 ^ string.quoted
#                ^ punctuation.section.interpolation.end
#              ^ punctuation.section.sequence.end
#      ^^^^^^^^ variable.other
#     ^ punctuation.section.sequence.begin
#    ^^^^^^^^^^^ source.elixir.embedded
#  ^^^^^^^^^^^^^^ meta.interpolation
#  ^^ punctuation.section.interpolation.begin
# ^ string.quoted
#^ punctuation.definition.string.begin
#^^^^^^^^^^^^^^^ meta.string
 's#{ {embedded} }s'nomod
#                   ^^^^^ variable.other
#^^^^^^^^^^^^^^^^^^^ meta.string

## Heredoc strings
 """
 #{1 + x}
#  ^^^^^ source.elixir.embedded
#^^^^^^^^ meta.interpolation.elixir
 """nomod
#   ^^^^^ variable.other

 '''
 #{1 + x}
#  ^^^^^ source.elixir.embedded
#^^^^^^^^ meta.interpolation.elixir
 '''nomod
#   ^^^^^ variable.other

## Interpolation inside heredoc
"""
 #{
   ~s""ss}
#        ^ punctuation.section.interpolation.end.elixir
"""

# Invalid characters after/before triple quotes.
"""wrong
#  ^^^^^ invalid.illegal
heredoc text
 as d """
#^^^^ invalid.illegal

# With sigil:
 ~s"""
#^^ storage.type.string.elixir
 #{1 + x}
#  ^^^^^ source.elixir.embedded
#^^^^^^^^ meta.interpolation.elixir
 """mods
#   ^^^^ string.quoted.modifiers

 ~S"""
#^^ storage.type.string.elixir
 #{1 + x}
#^^^^^^^^ string.quoted.triple
 """mods
#   ^^^^ string.quoted.modifiers

# Brackets are not balanced.
~s<<>angle ~s{{}curly ~s[[]square ~s(()round
#                                     ^ punctuation.definition.string.end
#                         ^ punctuation.definition.string.end
#              ^ punctuation.definition.string.end
#   ^ punctuation.definition.string.end

# Other delimiters.
~s""dquote ~s''squote ~s||pipe ~s//slash

~S(()round ~S[[]square ~S<<>angle ~S{{}curly
~S||pipe ~S//slash ~S""dquote ~S''squote


 ""''"#{ to_string(123) }"'#{ to_string(123) }'~r/\s{1,2}/i
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir

 ~s()r~s[]s~s<>a~s{}c~s||p~s//s~s""d~s''s~S()r~S[]s~S<>a~S{}c~S||p~S//s~S""d~S''s
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir
 ~r()r~r[]s~r<>a~r{}c~r||p~r//s~r""d~r''s~R()r~R[]s~R<>a~R{}c~R||p~R//s~R""d~R''s
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir
 ~a()r~a[]s~a<>a~a{}c~a||p~a//s~a""d~a''s~A()r~A[]s~A<>a~A{}c~A||p~A//s~A""d~A''s
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir


~s""m""m

~s"\""m ~s'\''m ~s/\//m ~s|\||m ~s<<\>>m ~s{{\}}m ~s[[\]]m ~s((\))m


## LiveView

~L"""
  <div class="">
    <div>
      <%= @deploy_step %>
#          ^^^^^^^^^^^ variable.other.constant
    </div>
  </div>
 \
#^^text.html.basic
  """

~L"""
<div><%= @var %></div>
#         ^^^ variable.other.constant.elixir
#   ^ -string
#^^^ entity.name.tag.block.any.html
#               ^^^^^^ meta.string.elixir
#    ^^^^^^^^^^^ meta.interpolation.eex
#^^^^ meta.string.elixir
 \"""m
#    ^ -storage.type.string
#^^ -constant.character.escape.char.elixir
 """m
#    ^ -meta.string.elixir
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
#^^^^ meta.string.elixir
~L"<div>\"</div>"m
#               ^ punctuation.definition.string.end
#       ^^ -constant.character.escape.char.elixir
#   ^^^ entity.name.tag.block.any.html
~L'<div>\'</div>'m
#               ^ punctuation.definition.string.end
#       ^^ -constant.character.escape.char.elixir
#   ^^^ entity.name.tag.block.any.html

 ~L/\//m ~L|\||m ~L{\}}m ~L[\]]m ~L<\>>m ~L(\))m
#                                              ^ string.quoted.modifiers
#                                      ^ string.quoted.modifiers
#                              ^ string.quoted.modifiers
#                      ^ string.quoted.modifiers
#              ^ string.quoted.modifiers
#      ^ string.quoted.modifiers

~L'''
 \
 ^^ text.html.basic -punctuation.separator.continuation
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end


## YAML

~y"""
  a: {xyz: "#{0}"}
  #//       ^^^^ meta.interpolation.elixir
  b: #{[1, 2, 3]}
  c:
  # FIXME: the c key isn't highlighted due to the interpolation on the previous line.
  """
~Y"""
  a: {bc: "#{0}"}
  #//      ^^^^^ string.quoted.double.yaml
  """

~y"""
key: #{value}
#      ^^^^^ variable.other.elixir
 \"""m
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
~y"\""m ~y'\''m ~y/\//m ~y|\||m ~y{\}}m ~y[\]]m ~y<\>>m ~y(\))m
#                                                            ^ punctuation.definition.string.end
#                                                    ^ punctuation.definition.string.end
#                                            ^ punctuation.definition.string.end
#                                    ^ punctuation.definition.string.end
#                            ^ punctuation.definition.string.end
#                    ^ punctuation.definition.string.end
#            ^ punctuation.definition.string.end
#    ^ punctuation.definition.string.end

~Y"""
key: "#{value}\"""
#             ^^ -constant.character.escape.char.elixir
 \"""m
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
~Y"\""m ~Y'\''m ~Y/\//m ~Y|\||m ~Y{\}}m ~Y[\]]m ~Y<\>>m ~Y(\))m
#                                                            ^ punctuation.definition.string.end
#                                                    ^ punctuation.definition.string.end
#                                            ^ punctuation.definition.string.end
#                                    ^ punctuation.definition.string.end
#                            ^ punctuation.definition.string.end
#                    ^ punctuation.definition.string.end
#            ^ punctuation.definition.string.end
#    ^ punctuation.definition.string.end


## JSON

~j"""
  {
    "key": "#{value}",
#//         ^^^^^^^^ meta.interpolation.elixir
    "#{key}": "value"
#//  ^^^^^^ meta.interpolation.elixir
  }
  """
~J"""
  {
    "key": "#{value}",
#//         ^^^^^^^^ string.quoted.double.json
    "#{key}": "value"
#// ^^^^^^^^ string.quoted.double.json
  }
  """

~j"1234"m
#       ^ storage.type.string
#      ^ punctuation.definition.string.end.elixir
#  ^^^^ constant.numeric
# ^ punctuation.definition.string.begin.elixir
# ^^^^^^ meta.string.elixir

~j/\//m ~j|\||m ~j{\}}m ~j[\]]m ~j<\>>m ~j(\))m
#                                            ^ punctuation.definition.string.end
#                                    ^ punctuation.definition.string.end
#                            ^ punctuation.definition.string.end
#                    ^ punctuation.definition.string.end
#            ^ punctuation.definition.string.end
#    ^ punctuation.definition.string.end

~J"1234"
#      ^ punctuation.definition.string.end.elixir
#  ^^^^ constant.numeric
# ^ punctuation.definition.string.begin.elixir
# ^^^^^^ meta.string.elixir

# TODO: how to handle JSON double quotes when escaped by Elixir rules?
~J"\"1234\""

~J'"\u0000"'

~J'"\'"'

~J'"\""'

~J"""
{
  "k\u0065y\"": "J"
}
 \"""
#^^ -constant.character.escape.char.elixir
 """a
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

~J'''
 \'''
#^^ -constant.character.escape.char
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

~J/\//m ~J|\||m ~J{\}}m ~J[\]]m ~J<\>>m ~J(\))m
#                                            ^ punctuation.definition.string.end
#                                    ^ punctuation.definition.string.end
#                            ^ punctuation.definition.string.end
#                    ^ punctuation.definition.string.end
#            ^ punctuation.definition.string.end
#    ^ punctuation.definition.string.end


## Regular expression strings

~r"\""i ~r'\''i ~r/\//i ~r|\||i ~r<<\>>i ~r{{\}}i ~r[[\]]i ~r((\))i
#                                                                 ^ string.quoted.modifiers.elixir
#                                                              ^^ constant.character.escape.pcree
#                                                             ^ punctuation.definition.group.begin.pcree
#                                                        ^ string.quoted.modifiers.elixir
#                                                     ^^ constant.character.escape.pcree
#                                                    ^ punctuation.definition.set.begin.pcree
#                                               ^ string.quoted.modifiers.elixir
#                                            ^^ constant.character.escape.pcree
#                                      ^ string.quoted.modifiers.elixir
#                                   ^^ constant.character.escape.pcree
#                             ^ string.quoted.modifiers.elixir
#                          ^^ constant.character.escape.pcree
#                     ^ string.quoted.modifiers.elixir
#                  ^^ constant.character.escape.pcree
#             ^ string.quoted.modifiers.elixir
#          ^^ constant.character.escape.pcree
#     ^ string.quoted.modifiers.elixir
#  ^^ constant.character.escape.pcree

~r"""   *
#    ^^^^ invalid.illegal.opening-heredoc.elixir
 *"""x
#    ^ string.quoted.modifiers.elixir
#^ invalid.illegal.closing-heredoc.elixir

~r'''   *
#    ^^^^ invalid.illegal.opening-heredoc.elixir
 *'''x
#    ^ string.quoted.modifiers.elixir
#^ invalid.illegal.closing-heredoc.elixir

~R"\""i ~R'\''i ~R/\//i ~R|\||i ~R<<\>>i ~R{{\}}i ~R[[\]]i ~R((\))i
#                                                                 ^ string.quoted.modifiers.elixir
#                                                              ^^ constant.character.escape.pcree
#                                                        ^ string.quoted.modifiers.elixir
#                                                     ^^ constant.character.escape.pcree
#                                               ^ string.quoted.modifiers.elixir
#                                            ^^ constant.character.escape.pcree
#                                      ^ string.quoted.modifiers.elixir
#                                   ^^ constant.character.escape.pcree
#                             ^ string.quoted.modifiers.elixir
#                          ^^ constant.character.escape.pcree
#                     ^ string.quoted.modifiers.elixir
#                  ^^ constant.character.escape.pcree
#             ^ string.quoted.modifiers.elixir
#          ^^ constant.character.escape.pcree
#     ^ string.quoted.modifiers.elixir
#  ^^ constant.character.escape.pcree

~R"""   *
#    ^^^^ invalid.illegal.opening-heredoc.elixir
 \"\'
#^^^^ constant.character.escape.pcree
 *"""x
#    ^ string.quoted.modifiers.elixir
#^ invalid.illegal.closing-heredoc.elixir

~R'''   *
#    ^^^^ invalid.illegal.opening-heredoc.elixir
 \'\"
#^^^^ constant.character.escape.pcree
 *'''x
#    ^ string.quoted.modifiers.elixir
#^ invalid.illegal.closing-heredoc.elixir


~r"""
\
#<- punctuation.separator.continuation
\"""
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
~r'''
\
#<- punctuation.separator.continuation
\'''
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
~R"""
\
#<- meta.literal.pcree
\"""
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
~R'''
\
#<- meta.literal.pcree
\'''
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

~r/function #Function<[0-9]\.[0-9]*\/
#                                   ^ punctuation.definition.string.end


## Escape chars

"\.\"\!\X\U\n\#{}"
#^^^^^^^^^^^^^^ constant.character.escape.char

"\x00\xFF"
#^^^^^^^^ constant.character.escape.hex
"\x"
#^^ constant.character.escape.hex
"\x1G"
#   ^ invalid.illegal.escape.hex
"\xH"
#  ^ invalid.illegal.escape.hex
"\xIJ\x\\\x#{}"
#          ^^^ meta.interpolation
#      ^^ constant.character.escape.char
#   ^ invalid.illegal.escape.hex

"\u1234"
#^^^^^^ constant.character.escape.unicode
"\u{0}\u{01}\u{012}\u{0123}\u{01234}\u{012345}\u{012346}"
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.character.escape.unicode
"\u"
#^^ constant.character.escape.char
"\uG\uHI\uJKL\uMNOP\uQRSTU\uVWXYZGH"
#                                 ^ -invalid.illegal.escape.unicode
#                           ^^^^^^ invalid.illegal.escape.unicode
#                    ^^^^^ invalid.illegal.escape.unicode
#              ^^^^ invalid.illegal.escape.unicode
#         ^^^ invalid.illegal.escape.unicode
#     ^^ invalid.illegal.escape.unicode
#  ^ invalid.illegal.escape.unicode
"\u0\u01\u012\u012G"
#              ^^^^ invalid.illegal.escape.unicode
#         ^^^ invalid.illegal.escape.unicode
#     ^^ invalid.illegal.escape.unicode
#  ^ invalid.illegal.escape.unicode
"\u{"
#  ^ invalid.illegal.escape.unicode
"\u{}"
#  ^^ invalid.illegal.escape.unicode
"\u{0123467}"
#  ^^^^^^^ invalid.illegal.escape.unicode


## Binary

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
<<x :: x / y>>
#        ^ -storage.type.binary
#      ^ storage.type.binary
<<0, 1::(2 + 3) <- x>>
#          ^ -storage.type.binary
#       ^^^^^^^ meta.type.binary
<< x <- bin >>
#       ^^^ variable.other
#    ^^ keyword.operator.arrow
#  ^ variable.other
<< func(x) >>
#       ^ variable.other
#  ^^^^ variable.function

<<_::(-4)>>
#       ^ punctuation.section.group.end
#     ^^ storage.type.binary
#    ^ punctuation.section.group.begin
#    ^^^^ meta.type.binary

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
<<(<<>>)::(<<>>)>>
#              ^ punctuation.section.group.end
#         ^ punctuation.section.group.begin
#         ^^^^^^ meta.type.binary.elixir
#      ^ punctuation.section.group.end
# ^ punctuation.section.group.begin

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

<< ~s<>>>
#      ^^ string.other.binary
#     ^^^ punctuation.definition.string.end
#    ^^ string.interpolated
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

<<(_::8)>>
# ^ punctuation.section.group.begin

<<x::do
#    ^^ keyword.context.block.do
 end>>
#^^^ keyword.context.block.end

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


## Other

"""
\"""
 """var
#   ^^^ variable.other
#^^^ punctuation.definition.string.end
'''
\'''
 '''var
#   ^^^ variable.other
#^^^ punctuation.definition.string.end

"\""var
#   ^^^ variable.other
'\''var
#   ^^^ variable.other

~S"""
\"""
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
~S'''
 \'''
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

~s"\""m ~s'\''m ~s/\//m ~s|\||m ~s{\}}m ~s[\]]m ~s<\>>m ~s(\))m
#                                                            ^ punctuation.definition.string.end
#                                                    ^ punctuation.definition.string.end
#                                            ^ punctuation.definition.string.end
#                                    ^ punctuation.definition.string.end
#                            ^ punctuation.definition.string.end
#                    ^ punctuation.definition.string.end
#            ^ punctuation.definition.string.end
#    ^ punctuation.definition.string.end

~S"\""m ~S'\''m ~S/\//m ~S|\||m ~S{\}}m ~S[\]]m ~S<\>>m ~S(\))m
#                                                            ^ punctuation.definition.string.end
#                                                    ^ punctuation.definition.string.end
#                                            ^ punctuation.definition.string.end
#                                    ^ punctuation.definition.string.end
#                            ^ punctuation.definition.string.end
#                    ^ punctuation.definition.string.end
#            ^ punctuation.definition.string.end
#    ^ punctuation.definition.string.end

~w"some words"
#       ^^^^^ -constant.other.symbol.atom
#  ^^^^ -constant.other.symbol.atom
~w"some atoms #{'chars'}"a
#                        ^ storage.type.string
#               ^^^^^^^ string.quoted.single
#             ^^^^^^^^^^ meta.interpolation
#       ^^^^^ constant.other.symbol.atom
#      ^ -constant.other.symbol.atom
#  ^^^^ constant.other.symbol.atom
# FIXME:
~w"some atoms #{"string"}"a
