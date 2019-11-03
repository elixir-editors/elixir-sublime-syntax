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

# Escape sequences:
~r"\d\h\s\v\w\D\H\S\V\W"
#//^^^^^^^^^^^^^^^^^^^^ constant.other.escape-sequence.regexp.elixir
~r"\p{C}\p{Cc}\p{Cf}\p{Cn}\p{Co}\p{Cs}\p{L}\p{Ll}\p{Lm}\p{Lo}\p{Lt}\p{Lu}\p{M}\p{Mc}\p{Me}\p{Mn}\p{N}\p{Nd}\p{Nl}\p{No}\p{P}\p{Pc}\p{Pd}\p{Pe}\p{Pf}\p{Pi}\p{Po}\p{Ps}\p{S}\p{Sc}\p{Sk}\p{Sm}\p{So}\p{Z}\p{Zl}\p{Zp}\p{Zs}"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.escape-sequence.general-category.regexp.elixir
~r"\p{C}\p{L}\p{M}\p{N}\p{P}\p{S}\p{Z}\pC\pL\pM\pN\pP\pS\pZ"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.escape-sequence.general-category.regexp.elixir
~r"\p{123}\p\p{}"
#//           ^^ invalid.illegal.general-category.regexp.elixir
#//       ^^ invalid.illegal.general-category.regexp.elixir
#//   ^^^ invalid.illegal.general-category.regexp.elixir
#//^^^^^^^^^ constant.other.escape-sequence.general-category.regexp.elixir
~r"\K\R\X\?\*\+\.\x00\00\07\o\o{}\o{84}\o{0}\cX\cä\a\e\f\n\r\t"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.character.escape

# Assertions:
~r"^\b\B\A\z\Z\G$"
#//^^^^^^^^^^^^^^ keyword.control.anchor

# Class sets:
# TODO:
~r"[.+*?{1}()|^$]"
#// ^^^^^^^^^^^^ meta.literal.regexp.elixir
#//^^^^^^^^^^^^^^ meta.set.regexp.elixir
~r"[[:>:]][]"
#//       ^^ invalid.illegal.set.regexp.elixir
#// ^^^^^ invalid.deprecated.word-boundary.regexp.elixir
~r"[
#// ^ meta.set.regexp.elixir
]"

# Inline options:
# TODO:
~r""

# Backtracking verbs:
# TODO:
~r""

# Groups:
# TODO:
~r""

# Operator:
~r"|"
#//^ keyword.operator.or.regexp.elixir

# Quantifiers:
# TODO:
~r""

# Dot meta character:
~r"."
#//^ keyword.other.any.regexp.elixir

# Literals:
~r[ !"#%&',-/0123456789:;<=>@ABCDEFGHIJKLMNOPQRSTUVWXYZ_`abcdefghijklmnopqrstuvwxyz{}~]
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
~r"äöüßȩşḑḩļçáóéíú€¢"
#//^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
~r"
#//^ meta.literal.regexp.elixir
"

# Elixir string interpolations:
# TODO:
~r" #{123}"
~r[ #{123}]
