#// SYNTAX TEST "Packages/ElixirSyntax/Elixir.sublime-syntax"

# Quoted sequence:
~r"\Qnot terminating \Q is not an error"
#//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
#//^^ keyword.control.quote.regexp.elixir

~r"\Q?+*{1} ^ $ . | ) ( $ \ \s \b \N [] \g<1>
#//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
#//^^ keyword.control.quote.regexp.elixir punctuation.definition.quote.begin.regexp.elixir
\E"
#//<- keyword.control.quote.regexp.elixir punctuation.definition.quote.end.regexp.elixir

# Quantifier after quoted sequence:
~r"\Qxyz\E{0,2}"
#//       ^^^^^ keyword.operator.quantifier.regexp.elixir


~r"{1}"~r"+"~r"\K*"~r"\b+"~r"|?"
#//                           ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//                     ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//              ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//       ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//^^^ invalid.illegal.unexpected-quantifier.regexp.elixir

~r"{} }{ {,} {,1} {1, } {1, 2} {1} {1,} {12} {1,2} {12,3} {12,34}"
#//                                                       ^^^^^^^ keyword.operator.quantifier.regexp.elixir
#//                                                ^^^^^^ keyword.operator.quantifier.regexp.elixir
#//                                          ^^^^^ keyword.operator.quantifier.regexp.elixir
#//                                     ^^^^ keyword.operator.quantifier.regexp.elixir
#//                                ^^^^ keyword.operator.quantifier.regexp.elixir
#//                            ^^^ keyword.operator.quantifier.regexp.elixir
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^  meta.literal.regexp.elixir

# Subroutine calls:
~r"\g<n>\g'n'\g<-1>\g<1>\g'-1'\g'1'\g'\g''\g<\g<>\g'aä'\g<aä>\g<aä\g<>\g<-0>"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.other.subroutine.regexp.elixir
~r"(?-1)(?0)(?+1)(?R)(?R(?P>n)(?&n)(?P>n(?&n(?P>aä)(?&aä)(?P>aä(?&aä(?P>(?P>)(?&(?&)"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.other.subroutine.regexp.elixir

# Back references:
~r"\g{2}\g-2\g0\g\g{as\g{\g{}\g{aä}\g0\g(?P=n)(?P=n(?P=ä(?P=ä)(?P=(?P=)"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.other.back-reference.regexp.elixir
~r"\k{n}\k'n'\k<n>\k\k{}\k<>\k''\k{\k<\k'\k{a\k<a\k'a\k{aä}\k<aä>\k'aä'"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.other.back-reference.regexp.elixir
#//                                                                  ^ invalid.illegal.back-reference.regexp.elixir
#//                                                                 ^ variable.other.back-reference.regexp.elixir
#//                                                            ^ invalid.illegal.back-reference.regexp.elixir
#//                                                           ^ variable.other.back-reference.regexp.elixir
#//                                                      ^ invalid.illegal.back-reference.regexp.elixir
#//                                                ^^ invalid.illegal.back-reference.regexp.elixir
#//                                            ^^ invalid.illegal.back-reference.regexp.elixir
#//                                        ^^ invalid.illegal.back-reference.regexp.elixir
#//                                     ^ invalid.illegal.back-reference.regexp.elixir
#//                                  ^ invalid.illegal.back-reference.regexp.elixir
#//                               ^ invalid.illegal.back-reference.regexp.elixir
#//                           ^^ invalid.illegal.back-reference.regexp.elixir
#//                       ^^ invalid.illegal.back-reference.regexp.elixir
#//                   ^^ invalid.illegal.back-reference.regexp.elixir
#//               ^^ invalid.illegal.back-reference.regexp.elixir
#//             ^ variable.other.back-reference.regexp.elixir
#//        ^ variable.other.back-reference.regexp.elixir
#//   ^ variable.other.back-reference.regexp.elixir
