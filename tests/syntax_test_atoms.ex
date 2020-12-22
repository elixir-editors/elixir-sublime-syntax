# SYNTAX TEST "Elixir.sublime-syntax"

## Atoms

 atom_key: :atom_sym
#          ^^^^^^^^^ constant.other.symbol
#          ^ punctuation.definition.constant.begin
#        ^ punctuation.definition.constant
#^^^^^^^^^ constant.other.keyword

 a::b
#   ^ -constant.other.symbol
# ^^ keyword.operator.colon
#^ -constant.other.keyword

 ^:"a"
# ^^^^ constant.other.symbol
#^ keyword.operator.pin
 ^:'a'
# ^^^^ constant.other.symbol
#^ keyword.operator.pin

# NB: this can only fixed by using ST4's branch look-ahead feature.
["abc #{"def"} ghi": :"abc #{"def"} ghi"]
#                          ^^^^^^^^ meta.interpolation.elixir
#     ^^^^^^^^ meta.interpolation.elixir
#^^^^^


### Atoms as keywords and equivalent symbols.

[
  "": :"", "\\": :"\\", "\"": :"\"", "a \#{:b} c\":": :"a \#{:b} c\":", "a#{'b'}c": :"a#{"b"}c",
#                                                                                            ^^ constant.other.symbol
#                                                                                      ^^^^^^ meta.interpolation.elixir
#                                                                                   ^^^ constant.other.symbol
#                                                                               ^^^ constant.other.keyword
#                                                                         ^^^^^^ meta.interpolation.elixir
#                                                                       ^^ constant.other.keyword
#                                                     ^^^^^^^^^^^^^^^^ constant.other.symbol
#                                    ^^^^^^^^^^^^^^^^ constant.other.keyword
#                             ^^^^^ constant.other.symbol
#                       ^^^^^ constant.other.keyword
#                ^^^^^ constant.other.symbol
#          ^^^^^ constant.other.keyword
#     ^^^ constant.other.symbol
# ^^^ constant.other.keyword
  '': :'', '\\': :'\\', '\'': :'\'', 'a \#{:b} c\':': :'a \#{:b} c\':', 'a#{"b"}c': :'a#{'b'}c',
#                                                                                            ^^ constant.other.symbol
#                                                                                      ^^^^^^ meta.interpolation.elixir
#                                                                                   ^^^ constant.other.symbol
#                                                                               ^^^ constant.other.keyword
#                                                                         ^^^^^^ meta.interpolation.elixir
#                                                                       ^^ constant.other.keyword
#                                                     ^^^^^^^^^^^^^^^^ constant.other.symbol
#                                    ^^^^^^^^^^^^^^^^ constant.other.keyword
#                             ^^^^^ constant.other.symbol
#                       ^^^^^ constant.other.keyword
#                ^^^^^ constant.other.symbol
#          ^^^^^ constant.other.keyword
#     ^^^ constant.other.symbol
# ^^^ constant.other.keyword
  Enum: :Enum, Kö: :Kö, Ö: :Ö, ö: :ö, Ä@: :Ä@, me@home@work: :me@home@work,
#                                                            ^^^^^^^^^^^^^ constant.other.symbol
#                                              ^^^^^^^^^^^^^ constant.other.keyword
#                                         ^^^ constant.other.symbol
#                                     ^^^ constant.other.keyword
#                                 ^^ constant.other.symbol
#                              ^^ constant.other.keyword
#                          ^^ constant.other.symbol
#                       ^^ constant.other.keyword
#                  ^^^ constant.other.symbol
#              ^^^ constant.other.keyword
#       ^^^^^ constant.other.symbol
# ^^^^^ constant.other.keyword
  =~: :=~, =: :=, ==: :==, ===: :===, !: :!, !=: :!=, !==: :!==, <<>>: :<<>>,
#                                                                      ^^^^^ constant.other.symbol
#                                                                ^^^^^ constant.other.keyword
#                                                          ^^^^ constant.other.symbol
#                                                     ^^^^ constant.other.keyword
#                                                ^^^ constant.other.symbol
#                                            ^^^ constant.other.keyword
#                                        ^^ constant.other.symbol
#                                     ^^ constant.other.keyword
#                               ^^^^ constant.other.symbol
#                          ^^^^ constant.other.keyword
#                     ^^^ constant.other.symbol
#                 ^^^ constant.other.keyword
#             ^^ constant.other.symbol
#          ^^ constant.other.keyword
#     ^^^ constant.other.symbol
# ^^^ constant.other.keyword
  <<<: :<<<, >>>: :>>>, ~~~: :~~~, <~>: :<~>, <~: :<~, <<~: :<<~, ~>: :~>,
#                                                                     ^^^ constant.other.symbol
#                                                                 ^^^ constant.other.keyword
#                                                           ^^^^ constant.other.symbol
#                                                      ^^^^ constant.other.keyword
#                                                 ^^^ constant.other.symbol
#                                             ^^^ constant.other.keyword
#                                       ^^^^ constant.other.symbol
#                                  ^^^^ constant.other.keyword
#                            ^^^^ constant.other.symbol
#                       ^^^^ constant.other.keyword
#                 ^^^^ constant.other.symbol
#            ^^^^ constant.other.keyword
#      ^^^^ constant.other.symbol
# ^^^^ constant.other.keyword
  ~>>: :~>>, |>: :|>, <|>: :<|>, /: :/, \\: :\\, *: :*, ..: :.., ...: :...,
#                                                                     ^^^^ constant.other.symbol
#                                                                ^^^^ constant.other.keyword
#                                                           ^^^ constant.other.symbol
#                                                       ^^^ constant.other.keyword
#                                                   ^^ constant.other.symbol
#                                                ^^ constant.other.keyword
#                                           ^^^ constant.other.symbol
#                                       ^^^ constant.other.keyword
#                                   ^^ constant.other.symbol
#                                ^^ constant.other.keyword
#                          ^^^^ constant.other.symbol
#                     ^^^^ constant.other.keyword
#                ^^^ constant.other.symbol
#            ^^^ constant.other.keyword
#      ^^^^ constant.other.symbol
# ^^^^ constant.other.keyword
  >=: :>=, <=: :<=, <: :<, <-: :<-, <>: :<>, ->: :->, >: :>,
#                                                        ^^ constant.other.symbol
#                                                     ^^ constant.other.keyword
#                                                ^^^ constant.other.symbol
#                                            ^^^ constant.other.keyword
#                                       ^^^ constant.other.symbol
#                                   ^^^ constant.other.keyword
#                              ^^^ constant.other.symbol
#                          ^^^ constant.other.keyword
#                      ^^ constant.other.symbol
#                   ^^ constant.other.keyword
#              ^^^ constant.other.symbol
#          ^^^ constant.other.keyword
#     ^^^ constant.other.symbol
# ^^^ constant.other.keyword
  -: :-, --: :--, ---: :---, +: :+, ++: :++, +++: :+++,
#                                                 ^^^^ constant.other.symbol
#                                            ^^^^ constant.other.keyword
#                                       ^^^ constant.other.symbol
#                                   ^^^ constant.other.keyword
#                               ^^ constant.other.symbol
#                            ^^ constant.other.keyword
#                      ^^^^ constant.other.symbol
#                 ^^^^ constant.other.keyword
#            ^^^ constant.other.symbol
#        ^^^ constant.other.keyword
#    ^^ constant.other.symbol
# ^^ constant.other.keyword
  &: :&, &&: :&&, &&&: :&&&, |: :|, ||: :||, |||: :|||, @: :@,
#                                                          ^^ constant.other.symbol
#                                                       ^^ constant.other.keyword
#                                                 ^^^^ constant.other.symbol
#                                            ^^^^ constant.other.keyword
#                                       ^^^ constant.other.symbol
#                                   ^^^ constant.other.keyword
#                               ^^ constant.other.symbol
#                            ^^ constant.other.keyword
#                      ^^^^ constant.other.symbol
#                 ^^^^ constant.other.keyword
#            ^^^ constant.other.symbol
#        ^^^ constant.other.keyword
#    ^^ constant.other.symbol
# ^^ constant.other.keyword
  {}: :{}, %{}: :%{}, %: :%, ^: :^, ^^^: :^^^, "::": :::
#                                                    ^^^ constant.other.symbol
#                                              ^^^^^ constant.other.keyword
#                                        ^^^^ constant.other.symbol
#                                   ^^^^ constant.other.keyword
#                               ^^ constant.other.symbol
#                            ^^ constant.other.keyword
#                        ^^ constant.other.symbol
#                     ^^ constant.other.keyword
#               ^^^^ constant.other.symbol
#          ^^^ constant.other.keyword
#     ^^^ constant.other.symbol
# ^^^ constant.other.keyword
]


### Special form variables

[
  __MODULE__: :__MODULE__, __ENV__: :__ENV__, __DIR__: :__DIR__,
#                                                      ^^^^^^^^ constant.other.symbol
#                                             ^^^^^^^^ constant.other.keyword
#                                   ^^^^^^^^ constant.other.symbol
#                          ^^^^^^^^ constant.other.keyword
#             ^^^^^^^^^^^ constant.other.symbol
# ^^^^^^^^^^^ constant.other.keyword
  __CALLER__: :__CALLER__, __STACKTRACE__: :__STACKTRACE__,
#                                          ^^^^^^^^^^^^^^^ constant.other.symbol
#                          ^^^^^^^^^^^^^^^ constant.other.keyword
#             ^^^^^^^^^^^ constant.other.symbol
# ^^^^^^^^^^^ constant.other.keyword
]


### Atom symbol exceptions:

[
  ?: :?,
#     ^^ constant.numeric
#    ^^ -constant.other.symbol
# ^^ constant.numeric -constant.other.keyword
  :::,
#    ^ punctuation.separator.sequence
# ^^^ constant.other.symbol
  :: ::,
#    ^^ keyword.operator.colon
# ^^ keyword.operator.colon
  **: :**,
#       ^ keyword.operator.arithmetic
#     ^^ constant.other.symbol
# ^^^ invalid.illegal.atom-keyword
  .: :.,
#    ^^ constant.other.symbol
# ^^ invalid.illegal.atom-keyword
  ^^: :^^,
#       ^ keyword.operator.pin
#     ^^ constant.other.symbol
# ^^^ invalid.illegal.atom-keyword
  []: :[],
#     ^^^ -constant.other.symbol
# ^^^ invalid.illegal.atom-keyword
  "[]": :"[]",
#       ^^^^^ constant.other.symbol
# ^^^^^ constant.other.keyword
]
