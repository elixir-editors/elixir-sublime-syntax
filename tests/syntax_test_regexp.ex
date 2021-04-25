# SYNTAX TEST "Elixir.sublime-syntax"

# Quoted sequence:
~r"\Qnot terminating \Q is not an error"
#    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.pcree
#  ^^ keyword.control.quote.pcree

~r"\Q?+*{1} ^ $ . | ) ( $ \ \s \b \N [] \g<1>
#    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.pcree
#  ^^ keyword.control.quote.pcree punctuation.definition.quote.begin.pcree
\E"
#  <- keyword.control.quote.pcree punctuation.definition.quote.end.pcree

# Quantifier after quoted sequence:
~r"\Qxyz\E{0,2}"
#         ^^^^^ keyword.operator.quantifier.pcree


~r"{1}"~r"+"~r"\K*"~r"\b+"~r"|?"
#                             ^ invalid.illegal.unexpected-quantifier.pcree
#                       ^ invalid.illegal.unexpected-quantifier.pcree
#                ^ invalid.illegal.unexpected-quantifier.pcree
#         ^ invalid.illegal.unexpected-quantifier.pcree
#  ^^^ invalid.illegal.unexpected-quantifier.pcree

# Subroutine calls:
~r"\g<n>\g'n'\g<-1>\g<1>\g'-1'\g'1'\g'\g''\g<\g<>\g'aä'\g<aä>\g<aä\g<>\g<-0>"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.other.subroutine.pcree
~r"(?-1)(?0)(?+1)(?R)(?R(?P>n)(?&n)(?P>n(?&n(?P>aä)(?&aä)(?P>aä(?&aä(?P>(?P>)(?&(?&)"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.other.subroutine.pcree

# Back references:
~r"\g{2}\g-2\g0\g\g{as\g{\g{}\g{aä}\g0\g(?P=n)(?P=n(?P=ä(?P=ä)(?P=(?P=)"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.other.back-reference.pcree
~r"\k{n}\k'n'\k<n>\k\k{}\k<>\k''\k{\k<\k'\k{a\k<a\k'a\k{aä}\k<aä>\k'aä'"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.other.back-reference.pcree
#                                                                    ^ invalid.illegal.back-reference.pcree
#                                                                   ^ variable.other.back-reference.pcree
#                                                              ^ invalid.illegal.back-reference.pcree
#                                                             ^ variable.other.back-reference.pcree
#                                                        ^ invalid.illegal.back-reference.pcree
#                                                  ^^ invalid.illegal.back-reference.pcree
#                                              ^^ invalid.illegal.back-reference.pcree
#                                          ^^ invalid.illegal.back-reference.pcree
#                                       ^ invalid.illegal.back-reference.pcree
#                                    ^ invalid.illegal.back-reference.pcree
#                                 ^ invalid.illegal.back-reference.pcree
#                             ^^ invalid.illegal.back-reference.pcree
#                         ^^ invalid.illegal.back-reference.pcree
#                     ^^ invalid.illegal.back-reference.pcree
#                 ^^ invalid.illegal.back-reference.pcree
#               ^ variable.other.back-reference.pcree
#          ^ variable.other.back-reference.pcree
#     ^ variable.other.back-reference.pcree

# Escape sequences:
~r"\d\h\s\v\w\D\H\S\V\W"
#  ^^^^^^^^^^^^^^^^^^^^ constant.other.escape-sequence.pcree
~r"\p{C}\p{Cc}\p{Cf}\p{Cn}\p{Co}\p{Cs}\p{L}\p{Ll}\p{Lm}\p{Lo}\p{Lt}\p{Lu}\p{M}\p{Mc}\p{Me}\p{Mn}\p{N}\p{Nd}\p{Nl}\p{No}\p{P}\p{Pc}\p{Pd}\p{Pe}\p{Pf}\p{Pi}\p{Po}\p{Ps}\p{S}\p{Sc}\p{Sk}\p{Sm}\p{So}\p{Z}\p{Zl}\p{Zp}\p{Zs}"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.escape-sequence.general-category.pcree
~r"\p{C}\p{L}\p{M}\p{N}\p{P}\p{S}\p{Z}\pC\pL\pM\pN\pP\pS\pZ"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.other.escape-sequence.general-category.pcree
~r"\p{123}\p\p{}"
#             ^^ invalid.illegal.general-category.pcree
#         ^^ invalid.illegal.general-category.pcree
#     ^^^ invalid.illegal.general-category.pcree
#  ^^^^^^^^^^^^^ constant.other.escape-sequence.general-category.pcree
~r"\K\R\X\?\*\+\.\x00\00\07\o\o{}\o{84}\o{0}\cX\cä\a\e\f\n\r\t"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ constant.character.escape

# Assertions:
~r"^\b\B\A\z\Z\G$"
#  ^^^^^^^^^^^^^^ keyword.control.anchor

# Class sets:
~r"[.+*?{1}()[|^$][\N\b\x\xf\xff\A\B\g\G\k\K\R\X\z\Z]"
#                               ^^^^^^^^^^^^^^^^^^^^ constant.character.escape.pcree
#                      ^^^^^^^^^ constant.character.escape.hex.pcree
#                    ^^ constant.character.escape.backspace.pcree
#                  ^^ invalid.illegal.escape-sequence.pcree
#   ^^^^^^^^^^^^^ meta.literal.pcree
#  ^^^^^^^^^^^^^^^ meta.set.pcree
~r"[[:>:]]"
#   ^^^^^ invalid.deprecated.word-boundary.pcree
~r"[a]][]][^]][^a]"
#               ^ meta.literal.pcree
#            ^ punctuation.definition.set.end.pcree
#           ^ meta.literal.pcree
#          ^ keyword.operator.negation.pcree
#        ^ punctuation.definition.set.end.pcree
#       ^ meta.literal.pcree
#     ^ meta.literal.pcree
#   ^ meta.literal.pcree
~r"[
#   ^ meta.set.pcree meta.literal.pcree
]"

~r"[a-b-c] [-a-z-] [\d-\s \w-\\] [\x0-\x1] [\x00-\xff] [\000-\007] [\0-\18]"
#                                                                        ^ meta.literal.pcree
#                                                            ^^^^ constant.other.range.pcree
#                                                           ^ keyword.operator.range.pcree
#                                                       ^^^^ constant.other.range.pcree
#                                                ^^^^ constant.other.range.pcree
#                                           ^^^^ constant.other.range.pcree
#                                     ^^^ constant.other.range.pcree
#                                 ^^^ constant.other.range.pcree
#                            ^^ constant.other.range.pcree
#                         ^^ invalid.illegal.range.pcree
#                      ^^ invalid.illegal.range.pcree
#                   ^^ invalid.illegal.range.pcree
#               ^ meta.literal.pcree
#             ^ keyword.operator.range.pcree
#           ^ meta.literal.pcree
#      ^^ meta.literal.pcree
~r"[-] [--] [---] [\--\-] [[--] [--[] [[-[] [[-] [[-\]] [\[-\]]"
#                                                        ^^ constant.other.range.pcree
#                                                   ^^ constant.other.range.pcree
#                                            ^^ meta.literal.pcree
#                                        ^ constant.other.range.pcree
#                                      ^ constant.other.range.pcree
#                                  ^ constant.other.range.pcree
#                            ^ constant.other.range.pcree
#                          ^ constant.other.range.pcree
#                     ^^ constant.other.range.pcree
#                  ^^ constant.other.range.pcree
#             ^ keyword.operator.range.pcree
#         ^ punctuation.definition.set.end.pcree
#       ^^ meta.literal.pcree
#   ^ meta.literal.pcree

# Inline options:
~r"(*NO_START_OPT)(*UTF)(*UTF8)(*UCP)(*CRLF)(*CR)(*LF)(*ANYCRLF)(*ANY)(*BSR_ANYCRLF)(*BSR_UNICODE)(*LIMIT_MATCH=)(*LIMIT_RECURSION=)(*ANY)"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ keyword.control.flag.pcree
~r"(*LIMIT_MATCH=1)(*LIMIT_RECURSION=2)"
#                                    ^ constant.numeric.integer.decimal.pcree
#                ^ constant.numeric.integer.decimal.pcree

# Backtracking verbs:
~r"(*ACCEPT)(*COMMIT)(*FAIL)(*F)(*MARK)(*THEN)(*PRUNE)(*SKIP)"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.backtracking.pcree
~r"(*ACCEPT:)(*COMMIT:)(*FAIL:)(*F:)(*MARK)(*THEN:)(*PRUNE:)(*SKIP:)(*:name)"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.backtracking.pcree
~r"(*ACCEPT:n)(*COMMIT:n)(*FAIL:n)(*F:n)(*MARK:)(*:)"
#                                                 ^ invalid.illegal.backtracking-verb.pcree
#                                             ^ invalid.illegal.backtracking-verb.pcree
#                                     ^ invalid.illegal.backtracking-verb.pcree
#                               ^ invalid.illegal.backtracking-verb.pcree
#                      ^ invalid.illegal.backtracking-verb.pcree
#           ^ invalid.illegal.backtracking-verb.pcree

# Groups:
~r"()"
#  ^^ meta.group.pcree keyword.control.group.pcree
#   ^ punctuation.definition.group.end.pcree
#  ^ punctuation.definition.group.begin.pcree
~r")"
#  ^ invalid.illegal.unmatched-brace.pcree

# Internal options:
~r"(?i)(?m)(?s)(?x)(?J)(?U)(?X)(?-)(?-:)(?-i:)"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.pcree
~r"(?i:)(?m:)(?s:)(?x:)(?J:)(?U:)(?X:)"

~r"(?=)(?!)(?<=)(?<!)(?>)(?:)(?|)"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.group.pcree

~r"(?P<name>)(?<name>)(?'name')"
#                        ^^^^ entity.name.capture-group.pcree
#               ^^^^ entity.name.capture-group.pcree
#      ^^^^ entity.name.capture-group.pcree
~r"(?<ä>)(?P<ä>)(?'ä')(?P<>)(?<>)(?P'name')(?<)(?')"
#                                               ^ invalid.illegal.unexpected-quantifier.pcree
#                                           ^ invalid.illegal.unexpected-quantifier.pcree
#                                  ^ invalid.illegal.named-capture.pcree
#                             ^^ invalid.illegal.named-capture.pcree
#                        ^^ invalid.illegal.named-capture.pcree
#                  ^ invalid.illegal.named-capture.pcree
#            ^ invalid.illegal.named-capture.pcree
#     ^ invalid.illegal.named-capture.pcree

~r"(?>atomic group)(?:non-capturing group)(?|reset group)"
#                                          ^^ keyword.control.reset-numbers-group.pcree
#                   ^^ keyword.control.non-capturing-group.pcree
#   ^^ keyword.control.atomic-group.pcree

~r"(?(Rx)t|f) (?(R)t|f) (?(R3)t|f) (?(R&r)t|f) (?(DEFINE)t|f) (?(DEFINEx)t|f)"
#                                                                ^^^^^^^ variable.other.back-reference.pcree
#                                                 ^^^^^^ keyword.other.conditional.definition.pcree
#                                       ^ variable.other.recursion.pcree
#                           ^ variable.other.recursion.pcree
#                ^ keyword.operator.recursion.pcree
#     ^^ variable.other.back-reference.pcree
~r"(?(condition)t|f) (?('condition')t|f) (?(<condition>)t|f)"
#                                            ^^^^^^^^^ variable.other.back-reference.pcree
#                        ^^^^^^^^^ variable.other.back-reference.pcree
#     ^^^^^^^^^ variable.other.back-reference.pcree
~r"(?(?=)t|f) (?(?!)t|f) (?(?<=)t|f) (?(?<!)t|f)"
#                                       ^^^^ meta.conditional.pcree
#                           ^^^^ meta.conditional.pcree
#               ^^^^ meta.conditional.pcree
#    ^^^^ meta.conditional.pcree
~r"(?(R3x)t|f) (?(DEFINE+xyz?)+t|f) (?()) (?()+) (?(?=+)+)"
#                                                       ^ invalid.illegal.unexpected-quantifier.pcree
#                                                     ^ invalid.illegal.unexpected-quantifier.pcree
#                                             ^ invalid.illegal.unexpected-quantifier.pcree
#                                           ^^ invalid.illegal.conditional.pcree
#                                     ^^ invalid.illegal.conditional.pcree
#                             ^ invalid.illegal.unexpected-quantifier.pcree
#                       ^^^^^ invalid.illegal.conditional.pcree
#       ^ invalid.illegal.conditional.pcree

# Operator:
~r"|(|)|"
#      ^ keyword.operator.alternation.pcree
#    ^ keyword.operator.alternation.pcree
#  ^ keyword.operator.alternation.pcree
~r"|+"
#   ^ invalid.illegal.unexpected-quantifier.pcree

# Quantifiers:
~r"x{1}y{1,2}"
#          ^ constant.numeric.quantifier.max.pcree
#         ^ punctuation.separator.quantifier.pcree
#        ^ constant.numeric.quantifier.min.pcree
#     ^ punctuation.definition.quantifier.end.pcree
#    ^ constant.numeric.quantifier.min.pcree
#   ^ punctuation.definition.quantifier.begin.pcree
~r"{} }{ {,} {,1} {1, } {1, 2} {1} {1,} {12} {1,2} {12,3} {12,34} {5}+ {6}?"
#                                                                      ^^^^ keyword.operator.quantifier.pcree
#                                                                 ^^^^ keyword.operator.quantifier.pcree
#                                                         ^^^^^^^ keyword.operator.quantifier.pcree
#                                                  ^^^^^^ keyword.operator.quantifier.pcree
#                                            ^^^^^ keyword.operator.quantifier.pcree
#                                       ^^^^ keyword.operator.quantifier.pcree
#                                  ^^^^ keyword.operator.quantifier.pcree
#                              ^^^ keyword.operator.quantifier.pcree
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^  meta.literal.pcree
~r"+*?{1}x{2}{3}+*? {4}* {5}+*"
#                            ^ invalid.illegal.unexpected-quantifier.pcree
#                      ^ invalid.illegal.unexpected-quantifier.pcree
#            ^^^^^^ invalid.illegal.unexpected-quantifier.pcree
#  ^^^^^^ invalid.illegal.unexpected-quantifier.pcree

# Dot meta character:
~r".[.]"
#    ^ meta.literal.pcree
#  ^ keyword.other.any.pcree

# Comments:
~r"(?#comment block)"
#  ^^^^^^^^^^^^^^^^^ comment.block.group.pcree
~r"# # comment line"
#    ^ comment.line.number-sign.pcree
#  ^^ meta.literal.pcree
~r"[ # not a comment inside a set]"
#   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.pcree
~r"\ # \\\ # # a comment"
#            ^^^^^^^^^^^ comment.line.number-sign.pcree
#          ^^ meta.literal.pcree
#      ^^^^ constant.character.escape.pcree
#    ^^ meta.literal.pcree
#  ^^ constant.character.escape.pcree
~r"\ # escape preceding space to prevent matching as a comment
#    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.pcree
#  ^^ constant.character.escape.pcree
(back to regex...)
#             ^^^ keyword.other.any.pcree
"
~r"\\ # match as comment with an even number of preceding backslashes
#     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment.line.number-sign.pcree
#  ^^ constant.character.escape.pcree
(back to regex...)
#             ^^^ keyword.other.any.pcree
"

~r"no preceding space#not a comment"
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.pcree
~R[ #{123}] ~r[ #{123}]
#               ^^^^^^ meta.interpolation.elixir
#              ^ meta.literal.pcree
#   ^^^^^^ comment.line.number-sign.pcree
#  ^ meta.literal.pcree

# Literals:
~r[ !"#%&',-/0123456789:;<=>@ABCDEFGHIJKLMNOPQRSTUVWXYZ_`abcdefghijklmnopqrstuvwxyz{}~]
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.literal.pcree
~r"äöüßȩşḑḩļçáóéíú€¢"
#  ^^^^^^^^^^^^^^^^^ meta.literal.pcree
~r"
#  ^ meta.literal.pcree
"

# Elixir string interpolations:

~r"_{0,#{1}} # #{2}"
#              ^^^^ meta.interpolation.elixir
#            ^^ comment.line.number-sign.pcree
#      ^^^^ meta.interpolation.elixir
