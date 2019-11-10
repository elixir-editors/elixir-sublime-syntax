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
~r"[.+*?{1}()|^$][\N\b]"
#//                 ^^ constant.character.escape.backspace.regexp.elixir
#//               ^^ invalid.illegal.escape-sequence.regexp.elixir
#// ^^^^^^^^^^^^ meta.literal.regexp.elixir
#//^^^^^^^^^^^^^^ meta.set.regexp.elixir
~r"[[:>:]][]"
#//       ^^ invalid.illegal.set.regexp.elixir
#// ^^^^^ invalid.deprecated.word-boundary.regexp.elixir
~r"[
#// ^ meta.set.regexp.elixir
]"

# Inline options:
~r"(*NO_START_OPT)(*UTF)(*UTF8)(*UCP)(*CRLF)(*CR)(*LF)(*ANYCRLF)(*ANY)(*BSR_ANYCRLF)(*BSR_UNICODE)(*LIMIT_MATCH=)(*LIMIT_RECURSION=)(*ANY)"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.control.flag.regexp.elixir

# Backtracking verbs:
~r"(*ACCEPT)(*COMMIT)(*FAIL)(*F)(*MARK)(*THEN)(*PRUNE)(*SKIP)"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.backtracking.regexp.elixir
~r"(*ACCEPT:)(*COMMIT:)(*FAIL:)(*F:)(*MARK)(*THEN:)(*PRUNE:)(*SKIP:)(*:name)"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.backtracking.regexp.elixir
~r"(*ACCEPT:n)(*COMMIT:n)(*FAIL:n)(*F:n)(*MARK:)(*:)"
#//                                               ^ invalid.illegal.backtracking-verb.regexp.elixir
#//                                           ^ invalid.illegal.backtracking-verb.regexp.elixir
#//                                   ^ invalid.illegal.backtracking-verb.regexp.elixir
#//                             ^ invalid.illegal.backtracking-verb.regexp.elixir
#//                    ^ invalid.illegal.backtracking-verb.regexp.elixir
#//         ^ invalid.illegal.backtracking-verb.regexp.elixir

# Groups:
# TODO:
~r""

# Operator:
~r"|(|)|"
#//    ^ keyword.operator.or.regexp.elixir
#//  ^ keyword.operator.or.regexp.elixir
#//^ keyword.operator.or.regexp.elixir
~r"|+"
#// ^ invalid.illegal.unexpected-quantifier.regexp.elixir

# Quantifiers:
~r"x{1}y{1,2}"
#//        ^ constant.numeric.quantifier.max.regexp.elixir
#//       ^ punctuation.separator.quantifier.regexp.elixir
#//      ^ constant.numeric.quantifier.min.regexp.elixir
#//   ^ punctuation.definition.quantifier.end.regexp.elixir
#//  ^ constant.numeric.quantifier.min.regexp.elixir
#// ^ punctuation.definition.quantifier.begin.regexp.elixir
~r"{} }{ {,} {,1} {1, } {1, 2} {1} {1,} {12} {1,2} {12,3} {12,34}"
#//                                                       ^^^^^^^ keyword.operator.quantifier.regexp.elixir
#//                                                ^^^^^^ keyword.operator.quantifier.regexp.elixir
#//                                          ^^^^^ keyword.operator.quantifier.regexp.elixir
#//                                     ^^^^ keyword.operator.quantifier.regexp.elixir
#//                                ^^^^ keyword.operator.quantifier.regexp.elixir
#//                            ^^^ keyword.operator.quantifier.regexp.elixir
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^  meta.literal.regexp.elixir
~r"+*?{1}x{2}{3}+*?"
#//          ^^^^^^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//^^^^^^ invalid.illegal.unexpected-quantifier.regexp.elixir

# Dot meta character:
~r".[.]"
#//  ^ meta.literal.regexp.elixir
#//^ keyword.other.any.regexp.elixir

# Comments:
~r"# # asdasd"
#//  ^ comment.line.number-sign.regexp.elixir
#//^^ meta.literal.regexp.elixir
~r"[ # not a comment inside a set]"
#// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
~r" # a comment"
#// ^^^^^^^^^^^ comment.line.number-sign.regexp.elixir
#//^ meta.literal.regexp.elixir
~r"\ # escape preceding space to prevent matching as a comment"
#//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
#//^^ constant.character.escape.regexp.elixir
~r"no preceding space#not a comment"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
~R[ #{123}] ~r[ #{123}]
#//             ^^^^^^ meta.interpolation.elixir
#//            ^ meta.literal.regexp.elixir
#// ^^^^^^ comment.line.number-sign.regexp.elixir
#//^ meta.literal.regexp.elixir

# Literals:
~r[ !"#%&',-/0123456789:;<=>@ABCDEFGHIJKLMNOPQRSTUVWXYZ_`abcdefghijklmnopqrstuvwxyz{}~]
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
~r"äöüßȩşḑḩļçáóéíú€¢"
#//^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
~r"
#//^ meta.literal.regexp.elixir
"

# Elixir string interpolations:

~r"_{0,#{1}} # #{2}"
#//            ^^^^ meta.interpolation.elixir
#//          ^^ comment.line.number-sign.regexp.elixir
#//    ^^^^ meta.interpolation.elixir
