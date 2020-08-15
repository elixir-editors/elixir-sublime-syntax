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
#//^^^^^^^^^^^^^ constant.other.escape-sequence.general-category.regexp.elixir
~r"\K\R\X\?\*\+\.\x00\00\07\o\o{}\o{84}\o{0}\cX\cä\a\e\f\n\r\t"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.character.escape

# Assertions:
~r"^\b\B\A\z\Z\G$"
#//^^^^^^^^^^^^^^ keyword.control.anchor

# Class sets:
~r"[.+*?{1}()[|^$][\N\b\x\xf\xff\A\B\g\G\k\K\R\X\z\Z]"
#//                             ^^^^^^^^^^^^^^^^^^^^ constant.character.escape.regexp.elixir
#//                    ^^^^^^^^^ constant.character.escape.hex.regexp.elixir
#//                  ^^ constant.character.escape.backspace.regexp.elixir
#//                ^^ invalid.illegal.escape-sequence.regexp.elixir
#// ^^^^^^^^^^^^^ meta.literal.regexp.elixir
#//^^^^^^^^^^^^^^^ meta.set.regexp.elixir
~r"[[:>:]]"
#// ^^^^^ invalid.deprecated.word-boundary.regexp.elixir
~r"[a]][]][^]][^a]"
#//             ^ meta.literal.regexp.elixir
#//          ^ punctuation.definition.set.end.regexp.elixir
#//         ^ meta.literal.regexp.elixir
#//        ^ keyword.operator.negation.regexp.elixir
#//      ^ punctuation.definition.set.end.regexp.elixir
#//     ^ meta.literal.regexp.elixir
#//   ^ meta.literal.regexp.elixir
#// ^ meta.literal.regexp.elixir
~r"[
#// ^ meta.set.regexp.elixir meta.literal.regexp.elixir
]"

~r"[a-b-c] [-a-z-] [\d-\s \w-\\] [\x0-\x1] [\x00-\xff] [\000-\007] [\0-\18]"
#//                                                                      ^ meta.literal.regexp.elixir
#//                                                          ^^^^ constant.other.range.regexp.elixir
#//                                                         ^ keyword.operator.range.regexp.elixir
#//                                                     ^^^^ constant.other.range.regexp.elixir
#//                                              ^^^^ constant.other.range.regexp.elixir
#//                                         ^^^^ constant.other.range.regexp.elixir
#//                                   ^^^ constant.other.range.regexp.elixir
#//                               ^^^ constant.other.range.regexp.elixir
#//                          ^^ constant.other.range.regexp.elixir
#//                       ^^ invalid.illegal.range.regexp.elixir
#//                    ^^ invalid.illegal.range.regexp.elixir
#//                 ^^ invalid.illegal.range.regexp.elixir
#//             ^ meta.literal.regexp.elixir
#//           ^ keyword.operator.range.regexp.elixir
#//         ^ meta.literal.regexp.elixir
#//    ^^ meta.literal.regexp.elixir
~r"[-] [--] [---] [\--\-] [[--] [--[] [[-[] [[-] [[-\]] [\[-\]]"
#//                                                      ^^ constant.other.range.regexp.elixir
#//                                                 ^^ constant.other.range.regexp.elixir
#//                                          ^^ meta.literal.regexp.elixir
#//                                      ^ constant.other.range.regexp.elixir
#//                                    ^ constant.other.range.regexp.elixir
#//                                ^ constant.other.range.regexp.elixir
#//                          ^ constant.other.range.regexp.elixir
#//                        ^ constant.other.range.regexp.elixir
#//                   ^^ constant.other.range.regexp.elixir
#//                ^^ constant.other.range.regexp.elixir
#//           ^ keyword.operator.range.regexp.elixir
#//       ^ punctuation.definition.set.end.regexp.elixir
#//     ^^ meta.literal.regexp.elixir
#// ^ meta.literal.regexp.elixir

# Inline options:
~r"(*NO_START_OPT)(*UTF)(*UTF8)(*UCP)(*CRLF)(*CR)(*LF)(*ANYCRLF)(*ANY)(*BSR_ANYCRLF)(*BSR_UNICODE)(*LIMIT_MATCH=)(*LIMIT_RECURSION=)(*ANY)"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.control.flag.regexp.elixir
~r"(*LIMIT_MATCH=1)(*LIMIT_RECURSION=2)"
#//                                  ^ constant.numeric.integer.decimal.regexp.elixir
#//              ^ constant.numeric.integer.decimal.regexp.elixir

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
~r"()"
#//^^ meta.group.regexp.elixir keyword.control.group.regexp.elixir
#// ^ punctuation.definition.group.end.regexp.elixir
#//^ punctuation.definition.group.begin.regexp.elixir
~r")"
#//^ invalid.illegal.unmatched-brace.regexp.elixir

# Internal options:
~r"(?i)(?m)(?s)(?x)(?J)(?U)(?X)(?-)(?-:)(?-i:)"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.regexp.elixir
~r"(?i:)(?m:)(?s:)(?x:)(?J:)(?U:)(?X:)"

~r"(?=)(?!)(?<=)(?<!)(?>)(?:)(?|)"
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.regexp.elixir

~r"(?P<name>)(?<name>)(?'name')"
#//                      ^^^^ entity.name.capture-group.regexp.elixir
#//             ^^^^ entity.name.capture-group.regexp.elixir
#//    ^^^^ entity.name.capture-group.regexp.elixir
~r"(?<ä>)(?P<ä>)(?'ä')(?P<>)(?<>)(?P'name')(?<)(?')"
#//                                             ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//                                         ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//                                ^ invalid.illegal.named-capture.regexp.elixir
#//                           ^^ invalid.illegal.named-capture.regexp.elixir
#//                      ^^ invalid.illegal.named-capture.regexp.elixir
#//                ^ invalid.illegal.named-capture.regexp.elixir
#//          ^ invalid.illegal.named-capture.regexp.elixir
#//   ^ invalid.illegal.named-capture.regexp.elixir

~r"(?>atomic group)(?:non-capturing group)(?|reset group)"
#//                                        ^^ keyword.control.reset-numbers-group.regexp.elixir
#//                 ^^ keyword.control.non-capturing-group.regexp.elixir
#// ^^ keyword.control.atomic-group.regexp.elixir

~r"(?(Rx)t|f) (?(R)t|f) (?(R3)t|f) (?(R&r)t|f) (?(DEFINE)t|f) (?(DEFINEx)t|f)"
#//                                                              ^^^^^^^ variable.other.back-reference.regexp.elixir
#//                                               ^^^^^^ keyword.other.conditional.definition.regexp
#//                                     ^ variable.other.recursion.regexp.elixir
#//                         ^ variable.other.recursion.regexp.elixir
#//              ^ keyword.operator.recursion.regexp.elixir
#//   ^^ variable.other.back-reference.regexp.elixir
~r"(?(condition)t|f) (?('condition')t|f) (?(<condition>)t|f)"
#//                                          ^^^^^^^^^ variable.other.back-reference.regexp.elixir
#//                      ^^^^^^^^^ variable.other.back-reference.regexp.elixir
#//   ^^^^^^^^^ variable.other.back-reference.regexp.elixir
~r"(?(?=)t|f) (?(?!)t|f) (?(?<=)t|f) (?(?<!)t|f)"
#//                                     ^^^^ meta.conditional.regexp.elixir
#//                         ^^^^ meta.conditional.regexp.elixir
#//             ^^^^ meta.conditional.regexp.elixir
#//  ^^^^ meta.conditional.regexp.elixir
~r"(?(R3x)t|f) (?(DEFINE+xyz?)+t|f) (?()) (?()+) (?(?=+)+)"
#//                                                     ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//                                                   ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//                                           ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//                                         ^^ invalid.illegal.conditional.regexp.elixir
#//                                   ^^ invalid.illegal.conditional.regexp.elixir
#//                           ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//                     ^^^^^ invalid.illegal.conditional.regexp.elixir
#//     ^ invalid.illegal.conditional.regexp.elixir

# Operator:
~r"|(|)|"
#//    ^ keyword.operator.alternation.regexp.elixir
#//  ^ keyword.operator.alternation.regexp.elixir
#//^ keyword.operator.alternation.regexp.elixir
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
~r"{} }{ {,} {,1} {1, } {1, 2} {1} {1,} {12} {1,2} {12,3} {12,34} {5}+ {6}?"
#//                                                                    ^^^^ keyword.operator.quantifier.regexp.elixir
#//                                                               ^^^^ keyword.operator.quantifier.regexp.elixir
#//                                                       ^^^^^^^ keyword.operator.quantifier.regexp.elixir
#//                                                ^^^^^^ keyword.operator.quantifier.regexp.elixir
#//                                          ^^^^^ keyword.operator.quantifier.regexp.elixir
#//                                     ^^^^ keyword.operator.quantifier.regexp.elixir
#//                                ^^^^ keyword.operator.quantifier.regexp.elixir
#//                            ^^^ keyword.operator.quantifier.regexp.elixir
#//^^^^^^^^^^^^^^^^^^^^^^^^^^^  meta.literal.regexp.elixir
~r"+*?{1}x{2}{3}+*? {4}* {5}+*"
#//                          ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//                    ^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//          ^^^^^^ invalid.illegal.unexpected-quantifier.regexp.elixir
#//^^^^^^ invalid.illegal.unexpected-quantifier.regexp.elixir

# Dot meta character:
~r".[.]"
#//  ^ meta.literal.regexp.elixir
#//^ keyword.other.any.regexp.elixir

# Comments:
~r"(?#comment block)"
#//^^^^^^^^^^^^^^^^^ comment.block.group.regexp.elixir
~r"# # comment line"
#//  ^ comment.line.number-sign.regexp.elixir
#//^^ meta.literal.regexp.elixir
~r"[ # not a comment inside a set]"
#// ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
~r"\ # \\\ # # a comment"
#//          ^^^^^^^^^^^ comment.line.number-sign.regexp.elixir
#//        ^^ meta.literal.regexp.elixir
#//    ^^^^ constant.character.escape.regexp.elixir
#//  ^^ meta.literal.regexp.elixir
#//^^ constant.character.escape.regexp.elixir
~r"\ # escape preceding space to prevent matching as a comment
#//  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.regexp.elixir
#//^^ constant.character.escape.regexp.elixir
(back to regex...)
#//           ^^^ keyword.other.any.regexp.elixir
"
~r"\\ # match as comment with an even number of preceding backslashes
#//   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.number-sign.regexp.elixir
#//^^ constant.character.escape.regexp.elixir
(back to regex...)
#//           ^^^ keyword.other.any.regexp.elixir
"

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
