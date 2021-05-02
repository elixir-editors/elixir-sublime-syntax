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
#        ^ variable.language.wildcard.asterisk.sql
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
#                 ^^^^^^^^^^ source.ex.sql support.function.psql
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
#                 ^ variable.language.wildcard.asterisk.sql
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

## Raw SQL queries

 sql("SELECT * FROM posts ORDER BY title GROUP BY user_id")
#                                              ^^ keyword.other.sql
#                                        ^^^^^ keyword.other.sql
#                               ^^ keyword.other.sql
#                         ^^^^^ keyword.other.sql
#                   ^^^^^ source.ex.sql
#              ^^^^ keyword.other.DML.sql
#            ^ variable.language.wildcard.asterisk.sql
#     ^^^^^^ keyword.other.DML.sql
#    ^^^^^^^^^^^^^^^^^^^^^ meta.string.elixir
#^^^ variable.function

 sql("SELECT sub_do.do FROM (SELECT * FROM dodos AS do) AS sub_do")
#                                                          ^^^^^^ variable.other.sql -keyword
#                                                   ^^ variable.other.sql -keyword
#                   ^^ variable.other.member.sql -keyword
#            ^^^^^^ constant.other.table-name.sql

 sql("INSERT INTO t (title) VALUES (...) ON CONFLICT DO NOTHING")
#                                                       ^^^^^^^ keyword.other.sql
#                                                    ^^ keyword.other.sql
#                                           ^^^^^^^^ keyword.other.sql
#                                        ^^ keyword.other.sql
#                           ^^^^^^ keyword.other.DML.II.sql
#                    ^^^^^ variable.other.sql
#                 ^ variable.other.sql
#            ^^^^ keyword.other.DML.sql
#     ^^^^^^ keyword.other.DML.sql

 sql("""
#    ^^^ punctuation.definition.string.begin
#^^^ variable.function
 WITH RECURSIVE t(n) AS (
#                    ^^ keyword.operator.assignment.alias.sql
#               ^^^^^^^^^^ source.ex.sql
#     ^^^^^^^^^ keyword.other.sql
#^^^^ keyword.other.DML.sql
     VALUES (1)
#            ^ constant.numeric.sql
#    ^^^^^^ keyword.other.DML.II.sql
   UNION ALL
#  ^^^^^^^^^ keyword.other.DML.sql
     SELECT n+1 FROM t WHERE n < 100
#                                ^^^ constant.numeric.sql
#                      ^^^^^ keyword.other.DML.sql
#               ^^^^ keyword.other.DML.sql
#             ^ constant.numeric.sql
#    ^^^^^^ keyword.other.DML.sql
 )
 SELECT sum(n) FROM t;
#              ^^^^ keyword.other.DML.sql
#       ^^^ support.function.aggregate.sql
#^^^^^^ keyword.other.DML.sql
 """)
#   ^ punctuation.section.arguments.end
#^^^ punctuation.definition.string.end

# All possible keywords. See: https://www.postgresql.org/docs/current/sql-keywords-appendix.html
 sql("""
  ALL; AND; ANY; ARRAY; AS; ASYMMETRIC; AUTHORIZATION; BINARY; BOTH;
#                                                              ^^^^ keyword.other.sql
#                                                      ^^^^^^ keyword.other.sql
#                                       ^^^^^^^^^^^^^ keyword.other.sql
#                           ^^^^^^^^^^ keyword.other.sql
#                       ^^ keyword.operator.assignment.alias.sql
#                ^^^^^ keyword.other.sql
#           ^^^ keyword.other.sql
#      ^^^ keyword.operator.logical.sql
# ^^^ keyword.other.sql
  CASE; CAST; CHECK; COLLATE; COLUMN; CONSTRAINT; CREATE; CROSS;
  CURRENT_CATALOG; CURRENT_DATE; CURRENT_ROLE; CURRENT_SCHEMA;
#                                              ^^^^^^^^^^^^^^ support.function.sql
#                                ^^^^^^^^^^^^ support.function.sql
#                  ^^^^^^^^^^^^ support.function.scalar.sql
# ^^^^^^^^^^^^^^^ support.function.sql
  CURRENT_TIME; CURRENT_TIMESTAMP; CURRENT_USER;
#                                  ^^^^^^^^^^^^ support.function.scalar.sql
#               ^^^^^^^^^^^^^^^^^ support.function.scalar.sql
# ^^^^^^^^^^^^ support.function.scalar.sql
  DEFAULT; DISTINCT; ELSE; END; EXCEPT; FALSE; FETCH; FOR; FOREIGN; FROM; FULL;
#                                                                         ^^^^ keyword.other.sql
#                                                                   ^^^^ keyword.other.DML.sql
#                                                          ^^^^^^^ keyword.other.sql
#                                                     ^^^ keyword.other.sql
#                                              ^^^^^ keyword.other.sql
#                                       ^^^^^ constant.boolean.sql
#                               ^^^^^^ keyword.other.sql
#                          ^^^ keyword.other.DML.sql
#                    ^^^^ keyword.other.DML.sql
#          ^^^^^^^^ keyword.other.sql
# ^^^^^^^ storage.modifier.sql
  GRANT; GROUP; HAVING; IN; INNER; INTERSECT; INTO; IS; JOIN; LATERAL; LEADING;
#                                                                      ^^^^^^^ keyword.other.sql
#                                                             ^^^^^^^ keyword.other.sql
#                                                       ^^^^ keyword.other.DML.sql
#                                                   ^^ keyword.other.sql
#                                             ^^^^ keyword.other.sql
#                                  ^^^^^^^^^ keyword.other.sql
#                           ^^^^^ keyword.other.sql
#                       ^^ keyword.other.sql
#               ^^^^^^ keyword.operator.logical.sql
#        ^^^^^ keyword.other.sql
# ^^^^^ keyword.other.authorization.sql
  LEFT; LIKE; LOCALTIME; LOCALTIMESTAMP; NATURAL; NOT; NULL; OFFSET; ON; ONLY; OR;
#                                                                              ^^ keyword.operator.logical.sql
#                                                                        ^^^^ keyword.other.sql
#                                                                    ^^ keyword.other.sql
#                                                            ^^^^^^ keyword.other.sql
#                                                      ^^^^ constant.language.sql
#                                                 ^^^ keyword.other.sql
#                                        ^^^^^^^ keyword.other.sql
#                        ^^^^^^^^^^^^^^ support.function.sql
#             ^^^^^^^^^ support.function.sql
#       ^^^^ keyword.operator.logical.sql
# ^^^^ keyword.other.sql
  ORDER; OUTER; OVERLAPS; PRIMARY; REFERENCES; RIGHT; SELECT; SESSION_USER; SIMILAR;
#                                                                           ^^^^^^^ keyword.other.sql
#                                                             ^^^^^^^^^^^^ support.function.scalar.sql
#                                                     ^^^^^^ keyword.other.DML.sql
#                                              ^^^^^ keyword.other.sql
#                                  ^^^^^^^^^^ storage.modifier.sql
#                         ^^^^^^^ keyword.other.sql
#               ^^^^^^^^ keyword.other.sql
#        ^^^^^ keyword.other.sql
# ^^^^^ keyword.other.sql
  SOME; SYMMETRIC; TABLE; TABLESAMPLE; THEN; TO; TRAILING; TRUE; UNION; UNIQUE;
#                                                                       ^^^^^^ keyword.other.sql
#                                                                ^^^^^ keyword.other.DML.sql
#                                                          ^^^^ constant.boolean.sql
#                                                ^^^^^^^^ keyword.other.sql
#                                            ^^ keyword.other.sql
#                                      ^^^^ keyword.other.DML.sql
#                         ^^^^^^^^^^^ keyword.other.sql
#                  ^^^^^ keyword.other.sql
#       ^^^^^^^^^ keyword.other.sql
# ^^^^ keyword.other.sql
  USER; USING; WHEN; WHERE; WINDOW; WITH
#                                   ^^^^ keyword.other.DML.sql
#                           ^^^^^^ keyword.other.sql
#                    ^^^^^ keyword.other.DML.sql
#              ^^^^ keyword.other.DML.sql
#       ^^^^^ keyword.other.DML.sql
# ^^^^ keyword.other.sql
""")
