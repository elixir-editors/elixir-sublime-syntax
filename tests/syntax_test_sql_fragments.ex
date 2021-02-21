# SYNTAX TEST "Elixir.sublime-syntax"

## SQL fragments

fragment()
#        ^ punctuation.section.arguments.end
#       ^ punctuation.section.arguments.begin
fragment("")
#        ^^ meta.string.elixir string.quoted.double.elixir
fragment("""
#        ^^^ punctuation.definition.string.begin.elixir
#        ^^^ string.quoted.triple.double.elixir
#        ^^^^ meta.string.elixir
 """)
#^^^ meta.string.elixir string.quoted.triple.double.elixir punctuation.definition.string.end.elixir
fragment("INSERT INTO table AS t (a, b) VALUES ($1, $2)")
#                                                   ^^ constant.other.parameter.sql
#                                               ^^ constant.other.parameter.sql
fragment("?"); fragment("\?"); fragment("\\?")
#                                          ^ keyword.operator.jsonb.psql
#                                        ^^ constant.character.escape.char.elixir
#                        ^^ constant.other.placeholder.elixir
#         ^ constant.other.placeholder.elixir
fragment("\\\?"); fragment("\\\\?")
#                               ^ keyword.operator.jsonb.psql
#                             ^^ constant.character.escape.char.elixir
#                           ^^ constant.character.escape.char.elixir
#           ^^ constant.other.placeholder.elixir
#         ^^ constant.character.escape.char.elixir
fragment("jsonb \\? jsonb OR jsonb \\?| jsonb OR jsonb \\?& jsonb")
#                                                        ^^ keyword.operator.jsonb.psql
#                                             ^^ keyword.operator.logical.sql
#                                    ^^ keyword.operator.jsonb.psql
#                         ^^ keyword.operator.logical.sql
#                 ^ keyword.operator.jsonb.psql
#               ^^ constant.character.escape.char.elixir
fragment("\"string\"")
#                 ^^ constant.character.escape.char.elixir
#         ^^ constant.character.escape.char.elixir
#         ^^^^^^^^^^ source.ex.sql

fragment("id::uuid")
#             ^^^^ storage.type.psql
#           ^^ keyword.operator.psql
#         ^^^^^^^^ source.ex.sql

fragment("ASC NULLS LAST")
#                   ^^^^ source.ex.sql constant.language.sql
#             ^^^^^ source.ex.sql constant.language.sql
#         ^^^ keyword.other.order.sql

fragment("\
#         ^^ source.ex.sql punctuation.separator.continuation
  SELECT *\
#         ^^ source.ex.sql punctuation.separator.continuation
#        ^ variable.language.star.sql
# ^^^^^^ keyword.other.DML.sql
-- Interpolations are not accepted by fragment(), but we match them anyway:
  FROM #{:posts}
#        ^^^^^^ constant.other.symbol.elixir
#      ^^^^^^^^^ meta.interpolation.elixir
# ^^^^ keyword.other.DML.sql
")

fragment(
#       ^ punctuation.section.arguments.begin
#<- support.function
  # Allow comments above query string:
# ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ comment
  "?.full_text <@ to_tsquery(?) -- Full text search.",
#                                                    ^ punctuation.separator.arguments
#                               ^^^^^^^^^^^^^^^^^^^^ comment.line.double-dash.sql
#                            ^ constant.other.placeholder.elixir
#                 ^^^^^^^^^^ source.ex.sql support.function.sql
#              ^^ keyword.operator.jsonb.psql
#  ^ constant.other.placeholder.elixir
#  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ source.ex.sql
  x,
#  ^ punctuation.separator.arguments
  ts_query
)
#<- punctuation.section.arguments.end

fragment("""
  jsonb_to_tsvector('simple', content, '["string", "numeric"]')
# ^^^^^^^^^^^^^^^^^ support.function.psql
""")

fragment("""\
#           ^ invalid.illegal.opening-heredoc
""")

@sql "..."
fragment(@sql, "ASC")
#              ^^^^^ string.quoted.double.elixir
#            ^ punctuation.separator.arguments
#         ^^^ variable
#        ^ keyword.operator.attribute

fragment(
#       ^ punctuation.section.arguments.begin
#<- support.function
  unquote("SELECT * FROM jsonb_populate_recordset(NULL::#{source}, to_jsonb(?))"),
#                                                                                ^ punctuation.separator.arguments
#                                                                               ^ punctuation.section.arguments.end
#                                                                           ^ constant.other.placeholder.elixir
#                                                                  ^^^^^^^^ support.function.psql
#                                                                ^^^^^^^^^^^ meta.string.elixir source.ex.sql
#                                                       ^^^^^^^^^ meta.string.elixir meta.interpolation.elixir
#                                                     ^^ keyword.operator.psql
#                        ^^^^^^^^^^^^^^^^^^^^^^^^ support.function.psql
#                 ^ variable.language.star.sql
#          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir source.ex.sql
#        ^ punctuation.section.arguments.begin
# ^^^^^^^ keyword.other.unquote
  ^unquote(values) |> type({:array, :map})
#                                        ^ punctuation.section.arguments.end
#                                   ^^^^ constant.other.symbol
#                           ^^^^^^ constant.other.symbol
#                         ^ punctuation.section.arguments.begin
#                     ^^^^ variable.function
#                  ^^ keyword.operator.pipe
#          ^^^^^^ variable.other
#  ^^^^^^^ keyword.other.unquote
)
