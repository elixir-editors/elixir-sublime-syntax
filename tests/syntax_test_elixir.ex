#// SYNTAX TEST "Packages/ElixirSyntax/Elixir.sublime-syntax"

## Declarations:

def func1() do
#// ^^^^^ entity.name.function
end

defmodule Some.Module do
#//            ^^^^^^ entity.name.namespace.elixir
#//       ^^^^ constant.other.module.elixir
  def func2() do
  end
end

defimpl Utility.YAY, for: Some.Module do
#//                            ^^^^^^ constant.other.module.elixir
#//                       ^^^^ constant.other.module.elixir
#//             ^^^ constant.other.module.elixir
  def types(_value), do: nil
end

defmodule X do
  defdelegate alive?(pid), to: :erlang, as: :is_process_alive
#//           ^^^^^^ entity.name.function
end

defprotocol Utility.ABC do
#//                 ^^^ entity.name.namespace.elixir
   @spec type(t) :: String.t()
   def type(value, opts)

   def type(value, opts) do
   end
end

## Attributes:

   @M
#// ^ invalid.illegal.attribute.elixir
   @type t
#//      ^ entity.name.type.elixir
#// ^^^^ keyword.declaration.type.elixir
#//^ keyword.operator.attribute.elixir

@vsn "1.0"
@compile
@before_compile
@after_compile
@deprecated "..."

@typedoc "Supported strategies"
@type strategy :: :one_for_one | :one_for_all | :rest_for_one

## YAML, JSON, LiveView:

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

## Strings:

{~w"""
   """s,
   """
   """, ~w{/#{{}}/}a, ~s{}, ~s"aasd"}
#//                                 ^ punctuation.section.sequence.end.elixir
#//            ^ punctuation.section.sequence.end.elixir
#//           ^ punctuation.section.sequence.begin.elixir
#//<~ punctuation.section.sequence.begin.elixir
   ~s<?~><><<?~>>
#//            ^^ punctuation.definition.string.end
#//        ^^ punctuation.definition.string.begin
#//      ^^ keyword.operator.binary-concat.elixir
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

## Heredoc strings:
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

## Interpolation inside heredoc:
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
   ~s/\u{1}\u{122222}\u1234/
   ~s/\u{1}\u{122222}\u/
   ~s/\usd \u{ssa01133} \uasa /
   ~s/\xaf\xa \xws/aasd w\s\//escapes
   ~r"[\p{sdas}]"
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

## Atom words string:

# TODO:
~w"abc  xyz"a
~w"aaa\" #{asd} bbb"a

## Character literals:

   ?	? ?
#//   ^^ invalid.illegal.character-literal.elixir
#// ^ invalid.illegal.character-literal.elixir
   ?\\ ?a ?? ?\
#//          ^^^ constant.numeric.elixir
#//       ^^ constant.numeric.elixir
#//    ^^ constant.numeric.elixir
#//^^^ constant.numeric.elixir

## Atoms as keywords and symbols.
[
  "": :"", "\\": :"\\", "\"": :"\"", "a \#{:b} c\":": :"a \#{:b} c\":", "#{''}": :"#{""}",
  Enum: :Enum, Kö: :Kö, Ö: :Ö, ö: :ö, Ä@: :Ä@, me@home@work: :me@home@work,
  =~: :=~, =: :=, ==: :==, ===: :===, !: :!, !=: :!=, !==: :!==, <<>>: :<<>>,
  <<<: :<<<, >>>: :>>>, ~~~: :~~~, <~>: :<~>, <~: :<~, <<~: :<<~, ~>: :~>,
  ~>>: :~>>, |>: :|>, <|>: :<|>, /: :/, \\: :\\, *: :*, ..: :.., ...: :...,
  >=: :>=, <=: :<=, <: :<, <-: :<-, <>: :<>, -: :-, --: :--, ->: :->, >: :>,
  &: :&, &&: :&&, &&&: :&&&, +: :+, ++: :++, |: :|, ||: :||, |||: :|||, @: :@,
  {}: :{}, %{}: :%{}, %: :%, ^: :^, ^^^: :^^^, "::": :::
]

# Atom symbol exceptions:
[
   :: ::,
#//   ^^ keyword.operator.colon.elixir
#//^^ keyword.operator.colon.elixir
   **: :**,
#//      ^ keyword.operator.arithmetic.elixir
#//    ^^ constant.other.symbol.elixir
#//^^^ invalid.illegal.atom-keyword.elixir
   .: :.,
#//   ^^ constant.other.symbol.elixir
#//^^ invalid.illegal.atom-keyword.elixir
   ^^: :^^,
#//    ^^^ constant.other.symbol.elixir
#//^^^ invalid.illegal.atom-keyword.elixir
   []: :[],
#//    ^^^ constant.other.symbol.elixir
#//^^^ invalid.illegal.atom-keyword.elixir
]


## Captures:

   &0; &1; &func/1; &Module.func/2
#//                              ^ constant.numeric
#//                             ^ punctuation.accessor.slash.elixir
#//                         ^^^^ variable.other.capture.elixir
#//                  ^^^^^^ constant.other.module.elixir
#//                 ^ keyword.operator.capture.elixir
#//              ^ constant.numeric
#//             ^ punctuation.accessor.slash.elixir
#//         ^^^^ variable.other.capture.elixir
#//        ^ keyword.operator.capture.elixir
#//    ^^ constant.other.capture.elixir
#//^^invalid.illegal.capture.elixir

## Function calls:

# TODO:
kernel.<>()
kernel.<>
&Kernel.<>/2
Kernel.<>()

  (&String.starts_with?/2).("a", "a")

   Mod.fun() Mod.fun.() mod.fun.()
#//                         ^ variable.function.elixir
#//              ^^^ variable.function.elixir
#//    ^^^ variable.function.elixir

   Module.a.b.c.d()
#//             ^ variable.function.elixir
#//           ^ variable.other.member.elixir
#//         ^ variable.other.member.elixir
#//       ^ variable.function.elixir

## Operators:
[
  [[l | r], l \\ r, l |> r, l -> r, l <- r, l => r, l .. r, l ++ r, l -- r, l <> r],

  [l != r, l == r, l !== r, l === r, l <= r, l < r, l >= r, l > r],

  [l not in r, l :: r],

  [l &&& r, l ||| r, l <<< r, l >>> r, l ~~~ r, l ^^^ r, l && r, l and r, l || r, l or r, l xor r],

  [not l, !l, -l, +l],

  [l - r, l + r, l * r, l / r],

  [l = r, (l; r), l.r]
]

   l &r
#//^ variable.function.elixir
   l +r
#//^ variable.function.elixir
   l -r
#//^ variable.function.elixir
   l << >>
#//^ variable.function.elixir

   assert not Enum.all?(list, & &1)
#//^^^^^^ variable.function
   assert+x
#//^^^^^^ variable.other
   assert +x
#//^^^^^^ variable.function
   assert-x
#//^^^^^^ variable.other
   assert -x
#//^^^^^^ variable.function
   [x ++ y, x++y]
   [x -- y, x--y]


# TODO:
   case A.aasd do
   end
   case a.bcd do
   end

   assert cond fn ->
   end

   assert cond do
#//       ^^^^ variable.other.elixir
#//^^^^^^ variable.function.elixir
     cond -> cond
#//          ^^^^ variable.other.elixir
#//  ^^^^ variable.other.elixir
     x.cond -> cond.x
#//            ^^^^ variable.other.elixir
#//    ^^^^ variable.other.member.elixir
   end

## Special forms:

   %__MODULE__{}
#// ^^^^^^^^^^ variable.language.special-form.elixir

  [__CALLER__: __CALLER__, __ENV__: __ENV__, __MODULE__: __MODULE__,
#//                                                      ^^^^^^^^^^ variable.language.special-form.elixir
#//                                          ^^^^^^^^^^^ constant.other.keyword.elixir
#//                                 ^^^^^^^ variable.language.special-form.elixir
#//                        ^^^^^^^^ constant.other.keyword.elixir
#//            ^^^^^^^^^^ variable.language.special-form.elixir
#//^^^^^^^^^^^ constant.other.keyword.elixir
   __DIR__: __DIR__, __STACKTRACE__: __STACKTRACE__]
#//                                  ^^^^^^^^^^^^^^ variable.language.special-form.elixir
#//                  ^^^^^^^^^^^^^^^ constant.other.keyword.elixir
#//         ^^^^^^^ variable.language.special-form.elixir
#//^^^^^^^^ constant.other.keyword.elixir

   :__DIR__.__DIR__
#//         ^^^^^^^ variable.other.member.elixir
#//^^^^^^^^ constant.other.symbol.elixir

## Regular expression strings:

~r"\""i ~r'\''i ~r/\//i ~r|\||i ~r<<\>>i ~r{{\}}i ~r[[\]]i ~r((\))i
#//                                                               ^ string.quoted.modifiers.elixir
#//                                                            ^^ constant.character.escape.regexp.elixir
#//                                                           ^ punctuation.definition.group.begin.regexp.elixir
#//                                                      ^ string.quoted.modifiers.elixir
#//                                                   ^^ constant.character.escape.regexp.elixir
#//                                                  ^ punctuation.definition.set.begin.regexp.elixir
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
