#// SYNTAX TEST "Packages/ElixirSyntax/Elixir.sublime-syntax"

# Strings:
##########

{~w"""
   """s,
   """
   """, ~w{/#{{}}/}a, ~s{}, ~s"aasd"}
#//                                 ^ punctuation.section.sequence.end.elixir
#//            ^ punctuation.section.sequence.end.elixir
#//           ^ punctuation.section.sequence.begin.elixir
#//<~ punctuation.section.sequence.begin.elixir

   ~s<?~><><<?~>>
#//            ^^ punctuation.definition.binary.end
#//        ^^ punctuation.definition.binary.begin
#//      ^^ keyword.operator.binary-concatenation
#//^^^^^^ meta.string
# TODO:      ^^ source.elixir constant.numeric.elixir

   "d#{ {embedded} }d"nomod
#//                   ^^^^^ variable.other
#//                  ^ punctuation.definition.string.end
#//                 ^ string.quoted
#//                ^ punctuation.section.interpolation.end.elixir
#//              ^ punctuation.section.sequence.end.elixir
#//      ^^^^^^^^ variable.other
#//     ^ punctuation.section.sequence.begin.elixir
#//    ^^^^^^^^^^^ source.elixir.embedded
#//  ^^^^^^^^^^^^^^ meta.interpolation.elixir
#//  ^^ punctuation.section.interpolation.begin.elixir
#// ^ string.quoted
#//^ punctuation.definition.string.begin
#//^^^^^^^^^^^^^^^ meta.string
   's#{ {embedded} }s'nomod
#//                   ^^^^^ variable.other
#//^^^^^^^^^^^^^^^^^^^ meta.string


# Heredoc strings:
   """
   #{1 + x}
#//  ^^^^^ source.elixir.embedded
#//^^^^^^^^ meta.interpolation.elixir
   """nomod
#//   ^^^^^ variable.other

   '''
   #{1 + x}
#//  ^^^^^ source.elixir.embedded
#//^^^^^^^^ meta.interpolation.elixir
   '''nomod
#//   ^^^^^ variable.other

# Interpolation inside heredoc:
"""
  #{
    ~s""ss}
#//       ^ punctuation.section.interpolation.end.elixir
"""

# Invalid characters after/before triple quotes.
"""wrong
#//^^^^^ invalid.illegal
heredoc text
   as d """
#//^^^ invalid.illegal

# With sigil:
   ~s"""
#//^^ storage.type.string.elixir
   #{1 + x}
#//  ^^^^^ source.elixir.embedded
#//^^^^^^^^ meta.interpolation.elixir
   """mods
#//   ^^^^ string.quoted.modifiers

   ~S"""
#//^^ storage.type.string.elixir
   #{1 + x}
#//^^^^^^^^ string.quoted.triple
   """mods
#//   ^^^^ string.quoted.modifiers

# Escape chars, including invalid hex escapes.
   ~s/\xaf\xa \xww\s\//escapes
#//                    ^^^^^^^ storage.type.string.elixir
#//               ^^^^ constant.character.escape.char.elixir
#//              ^ invalid.illegal
#//          ^ invalid.illegal
#//   ^^^^^^^ constant.character.escape.hex.elixir
#//^^ storage.type.string.elixir

# Brackets are left unbalanced.
~s(()round ~s[[]square ~s<<>angle ~s{{}curly
# Other delimiters.
~s||pipe ~s//slash ~s""dquote ~s''squote

~S(()round ~S[[]square ~S<<>angle ~S{{}curly
~S||pipe ~S//slash ~S""dquote ~S''squote


   ""''"#{ to_string(123) }"'#{ to_string(123) }'~r/\s{1,2}/i
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir
   ~s()r~s[]s~s<>a~s{}c~s||p~s//s~s""d~s''s~S()r~S[]s~S<>a~S{}c~S||p~S//s~S""d~S''s
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir

# Atom words string:
{~w"\" \#{} \\ xyz"a, "a"}

# Atoms as keywords and symbols.
[
  "": :"", "\\": :"\\", "\"": :"\"", "a \#{:b} c\":": :"a \#{:b} c\":", "#{''}": :"#{""}",
  Ö: :Ö, ö: :ö, Ä@: :Ä@, :me@home@work :me@home@work,
  =~: :=~, =: :=, ==: :==, ===: :===, !: :!, !=: :!=, !==: :!==, <<>>: :<<>>,
  <<<: :<<<, >>>: :>>>, ~~~: :~~~, <~>: :<~>, <~: :<~, <<~: :<<~, ~>: :~>,
  ~>>: :~>>, |>: :|>, <|>: :<|>, /: :/, \\: :\\, *: :*, ..: :.., ...: :...,
  >=: :>=, <=: :<=, <: :<, <-: :<-, <>: :<>, -: :-, --: :--, ->: :->, >: :>,
  &: :&, &&: :&&, &&&: :&&&, +: :+, ++: :++, |: :|, ||: :||, |||: :|||, @: :@,
  {}: :{}, %{}: :%{}, %: :%, ^: :^, ^^^: :^^^
]

# Exceptions:
[
   **: :**,
#//    ^^^ constant.other.symbol.elixir
#//^^ keyword.operator.other.elixir
   .: :.,
#//   ^^ constant.other.symbol.elixir
#//^ punctuation.separator.method.elixir
   ^^: :^^,
#//    ^^ constant.other.symbol.elixir
#// ^^ constant.other.symbol.elixir
   []: :[],
#//    ^^^ constant.other.symbol.elixir
#//^^ punctuation.section.array.elixir
]

# Regular expression strings:
~r"\""i ~r'\''i ~r/\//i ~r|\||i ~r<<\>>i ~r{{\}}i ~r[[\]]i ~r((\))i
#//                                                               ^ string.quoted.modifiers.elixir
#//                                                            ^^ constant.character.escape.regexp.elixir
#//                                                      ^ string.quoted.modifiers.elixir
#//                                                   ^^ constant.character.escape.regexp.elixir
#//                                             ^ string.quoted.modifiers.elixir
#//                                          ^^ constant.character.escape.regexp.elixir
#//                                    ^ string.quoted.modifiers.elixir
#//                                 ^^ constant.character.escape.regexp.elixir
#//                           ^ string.quoted.modifiers.elixir
#//                        ^^ constant.character.escape.regexp.elixir
#//                   ^ string.quoted.modifiers.elixir
#//                ^^ constant.character.escape.regexp.elixir
#//           ^ string.quoted.modifiers.elixir
#//        ^^ constant.character.escape.regexp.elixir
#//   ^ string.quoted.modifiers.elixir
#//^^ constant.character.escape.regexp.elixir
  ~r"""   *
#//    ^^^^ invalid.illegal.opening-heredoc.elixir
   *"""x
#//    ^ string.quoted.modifiers.elixir
#//^ invalid.illegal.closing-heredoc.elixir
  ~r'''   *
#//    ^^^^ invalid.illegal.opening-heredoc.elixir
   *'''x
#//    ^ string.quoted.modifiers.elixir
#//^ invalid.illegal.closing-heredoc.elixir
~R"\""i ~R'\''i ~R/\//i ~R|\||i ~R<<\>>i ~R{{\}}i ~R[[\]]i ~R((\))i
#//                                                               ^ string.quoted.modifiers.elixir
#//                                                            ^^ constant.character.escape.regexp.elixir
#//                                                      ^ string.quoted.modifiers.elixir
#//                                                   ^^ constant.character.escape.regexp.elixir
#//                                             ^ string.quoted.modifiers.elixir
#//                                          ^^ constant.character.escape.regexp.elixir
#//                                    ^ string.quoted.modifiers.elixir
#//                                 ^^ constant.character.escape.regexp.elixir
#//                           ^ string.quoted.modifiers.elixir
#//                        ^^ constant.character.escape.regexp.elixir
#//                   ^ string.quoted.modifiers.elixir
#//                ^^ constant.character.escape.regexp.elixir
#//           ^ string.quoted.modifiers.elixir
#//        ^^ constant.character.escape.regexp.elixir
#//   ^ string.quoted.modifiers.elixir
#//^^ constant.character.escape.regexp.elixir
  ~R"""   *
#//    ^^^^ invalid.illegal.opening-heredoc.elixir
   *"""x
#//    ^ string.quoted.modifiers.elixir
#//^ invalid.illegal.closing-heredoc.elixir
  ~R'''   *
#//    ^^^^ invalid.illegal.opening-heredoc.elixir
   *'''x
#//    ^ string.quoted.modifiers.elixir
#//^ invalid.illegal.closing-heredoc.elixir
