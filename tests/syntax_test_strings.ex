# SYNTAX TEST "Elixir.sublime-syntax"

# Strings

{~w"""
   """s,
   """
   """, ~w{/#{{}}/}a, ~s{}, ~s"aasd"}
#                                   ^ punctuation.section.sequence.end.elixir
#              ^ punctuation.section.sequence.end.elixir
#             ^ punctuation.section.sequence.begin.elixir
#  <~ punctuation.section.sequence.begin.elixir
 ~s<?~><><<?~>>
#            ^^ punctuation.definition.string.end
#        ^^ punctuation.definition.string.begin
#      ^^ keyword.operator.binary-concat.elixir
#^^^^^^ meta.string

 "d#{ {embedded} }d"nomod
#                   ^^^^^ variable.other
#                  ^ punctuation.definition.string.end
#                 ^ string.quoted
#                ^ punctuation.section.interpolation.end.elixir
#              ^ punctuation.section.sequence.end.elixir
#      ^^^^^^^^ variable.other
#     ^ punctuation.section.sequence.begin.elixir
#    ^^^^^^^^^^^ source.elixir.embedded
#  ^^^^^^^^^^^^^^ meta.interpolation.elixir
#  ^^ punctuation.section.interpolation.begin.elixir
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

# Escape chars, including invalid hex escapes.
 ~s/\u{1}\u{122222}\u1234/
 ~s/\u{1}\u{122222}\u/
 ~s/\usd \u{ssa01133} \uasa /
 ~s/\xaf\xa \xws/aasd w\s\//escapes
 ~r"[\p{sdas}]"
 ~s/\xaf\xa \xww\s\//escapes
#                    ^^^^^^^ storage.type.string.elixir
#               ^^^^ constant.character.escape.char.elixir
#              ^ invalid.illegal
#          ^ invalid.illegal
#   ^^^^^^^ constant.character.escape.hex.elixir
#^^ storage.type.string.elixir

# Brackets are left unbalanced.
~s(()round ~s[[]square ~s<<>angle ~s{{}curly
# Other delimiters.
~s||pipe ~s//slash ~s""dquote ~s''squote

~S(()round ~S[[]square ~S<<>angle ~S{{}curly
~S||pipe ~S//slash ~S""dquote ~S''squote


 ""''"#{ to_string(123) }"'#{ to_string(123) }'~r/\s{1,2}/i
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir
 ~s()r~s[]s~s<>a~s{}c~s||p~s//s~s""d~s''s~S()r~S[]s~S<>a~S{}c~S||p~S//s~S""d~S''s
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir

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
 *"""x
#    ^ string.quoted.modifiers.elixir
#^ invalid.illegal.closing-heredoc.elixir

~R'''   *
#    ^^^^ invalid.illegal.opening-heredoc.elixir
 *'''x
#    ^ string.quoted.modifiers.elixir
#^ invalid.illegal.closing-heredoc.elixir


## YAML, JSON, LiveView

~L"""
  <div class="">
    <div>
      <%= @deploy_step %>
    </div>
  </div>
  """

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

## LiveView

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
#^^ constant.character.escape.char.elixir
 """m
#    ^ -meta.string.elixir
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
#^^^^ meta.string.elixir
~L"<div>\"</div>"m
#               ^ punctuation.definition.string.end
#       ^^ constant.character.escape.char.elixir
#   ^^^ entity.name.tag.block.any.html
~L'<div>\'</div>'m
# NB: inactive checks to support ST3 for now.
                ^ punctuation.definition.string.end
        ^^ constant.character.escape.char.elixir
    ^^^ entity.name.tag.block.any.html
~L/\//m ~L|\||m ~L{\}}m ~L[\]]m ~L<\>>m ~L(\))m

~L'''
 '''m
# NB: inactive checks to support ST3 for now.
    ^ storage.type.string
 ^^^ punctuation.definition.string.end


## YAML

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
#             ^^ constant.character.escape.char.elixir
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
#^^ constant.character.escape.char.elixir
 """a
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

~J'''
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


## Regex

~r"""
\"""
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
~r'''
\'''
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
~r"\""m ~r'\''m ~r/\//m ~r|\||m ~r{\}}m ~r[\]]m ~r<\>>m ~r(\))m
#                                                            ^ punctuation.definition.string.end
#                                                    ^ punctuation.definition.string.end
#                                            ^ punctuation.definition.string.end
#                                    ^ punctuation.definition.string.end
#                            ^ punctuation.definition.string.end
#                    ^ punctuation.definition.string.end
#            ^ punctuation.definition.string.end
#    ^ punctuation.definition.string.end

~R"""
\"""
 """m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end
~R'''
\'''
 '''m
#   ^ storage.type.string
#^^^ punctuation.definition.string.end

~R"\""m ~R'\''m ~R/\//m ~R|\||m ~R{\}}m ~R[\]]m ~R<\>>m ~R(\))m
#                                                            ^ punctuation.definition.string.end
#                                                    ^ punctuation.definition.string.end
#                                            ^ punctuation.definition.string.end
#                                    ^ punctuation.definition.string.end
#                            ^ punctuation.definition.string.end
#                    ^ punctuation.definition.string.end
#            ^ punctuation.definition.string.end
#    ^ punctuation.definition.string.end


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
~w"some words"a
#             ^ storage.type.string
#       ^^^^^ constant.other.symbol.atom
#  ^^^^ constant.other.symbol.atom
