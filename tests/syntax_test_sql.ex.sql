-- SYNTAX TEST "SQL (Elixir).sublime-syntax"

-- Identifiers

  SELECT * FROM posts;
--       ^ constant.other.wildcard.asterisk

  SELECT posts."column";
--              ^^^^^^ string
--       ^^^^^ constant.other.table-name

  SELECT posts.*;
--             ^ constant.other.wildcard.asterisk
--            ^ punctuation.accessor.dot
--       ^^^^^ constant.other.table-name
  SELECT json_object(posts.*);
--                         ^ constant.other.wildcard.asterisk
--                        ^ punctuation.accessor.dot
--                   ^^^^^ constant.other.table-name

  SELECT array_agg(vote) FILTER (WHERE vote IS NOT NULL) FROM posts
--                                                            ^^^^^ variable.other
--                                                       ^^^^ keyword.other.DML
--                                                 ^^^^ constant.language.null
--                                             ^^^ keyword.other
--                                          ^^ keyword.other
--                                     ^^^^ variable.other
--                               ^^^^^ keyword.other.DML
--                       ^^^^^^ keyword.other
--                 ^^^^ variable.other
--       ^^^^^^^^^ variable.function

-- Numbers

  SELECT 123, 123., 123.45, .123;
--                          ^ punctuation.separator.decimal
--                          ^^^^ constant.numeric
--                     ^ punctuation.separator.decimal
--                  ^^^^^^ constant.numeric
--            ^^^^ constant.numeric
--       ^^^ constant.numeric
  SELECT 123e01, 123.e01, 123.45e01, .123e01;
--                                   ^ punctuation.separator.decimal
--                                   ^^^^^^^ constant.numeric
--                           ^ punctuation.separator.decimal
--                        ^^^^^^^^^ constant.numeric
--                  ^ punctuation.separator.decimal
--               ^^^^^^^ constant.numeric
--       ^^^^^^ constant.numeric
  SELECT 123e-01, 123.e-01, 123.45e-01, .123e-01;
--                                      ^ punctuation.separator.decimal
--                                       ^^^^^^^ constant.numeric
--                             ^ punctuation.separator.decimal
--                          ^^^^^^^^^^ constant.numeric
--                   ^ punctuation.separator.decimal
--                ^^^^^^^^ constant.numeric
--       ^^^^^^^ constant.numeric
  SELECT 123e+01, 123.e+01, 123.45e+01, .123e+01;
--                                      ^ punctuation.separator.decimal
--                                       ^^^^^^^ constant.numeric
--                             ^ punctuation.separator.decimal
--                          ^^^^^^^^^^ constant.numeric
--                   ^ punctuation.separator.decimal
--                ^^^^^^^^ constant.numeric
--       ^^^^^^^ constant.numeric
  SELECT 1E0, 1.E1, 1.0E1, .1E1;
--                         ^^^^ constant.numeric
--                  ^^^^^ constant.numeric
--            ^^^^ constant.numeric
--       ^^^ constant.numeric
  SELECT 1 + .e01;
--           ^ - punctuation.separator.decimal
--           ^^^^ - constant.numeric

