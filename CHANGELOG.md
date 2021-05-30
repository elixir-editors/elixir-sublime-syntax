# Changelog

## [v2.0.5] – 2021-05-30

- Elixir: also highlight `catch`, `else`, `after` clauses in function do-end blocks.
- Elixir: use own scopes for `after` and `rescue` keywords.
- Elixir: allow commas inside item access brackets, e.g.: `%{}[a: 1, b: 2]`
- Elixir: fixed: some multi-line when-type clauses were not matched correctly.
- Elixir: don't match `def func()` as a type after writing a `|` in a type spec.
- Elixir: use greedy matching for identifiers and atoms as well.
- Elixir: the `meta.mapping.elixir` scope wasn't set correctly for maps.
- SQL: fixed escapes breaking strings, e.g.: `fragment("? = '\"string\"'::jsonb", x)`

## [v2.0.4] – 2021-05-17

- Elixir: use greedy matching for module names.

## [v2.0.3] – 2021-05-13

- Elixir: moved syntax and color-scheme files into sub-folders.
- Elixir: highlight EEx tags inside comments.

## [v2.0.2] – 2021-05-05

- Elixir: fixed a bug where a comma was seen as invalid, such as in `if a == nil, ...`.
- SQL: added decimal number highlighting.
- SQL: added general function-call syntax matching.
- SQL: removed `support.function.psql` scope to simplify the file.

## [v2.0.1] – 2021-05-02

- Elixir: fixed a bug affecting, for example, multi-line `with` statements.
- Elixir: fixed captures such as `&MyApp.User |> f(&1)`.
- Elixir: fixed matching iex continuation lines (`...>`) in markdown comments.
- SQL: highlight `BY` as a standalone keyword.

## [v2.0.0] – 2021-04-27

The Elixir syntax definition has been reworked amounting to a complete rewrite
bringing among other things the following features and improvements:

- Type highlighting in `@spec`, `@type`, `@typep`, `@opaque`, `@callback` and `@macrocallback`.
- Parameter highlighting (also in `fn`, `case`, `with`, `for`, `try` and `receive`).
- Function call highlighting (e.g. `inspect error`, `Enum.map(...)`).
- Highlight `as: A` argument in alias/require statements.
- Better matching for `def`/`defmodule`/etc. statements.
- Highlight quoted member variables/functions (e.g. `:erlang."=/="(1, 2)`).
- Fixes to strings, numerics, escapes, captures etc.
- Newest Elixir operators and functions.
- Highlight LiveView, YAML and JSON strings.
- Syntax definition for EEx in Elixir, e.g.: `defmodule <%= @module %>.View do end`
- Some keywords are variables depending on the context (e.g. `def = 0`).
- Markdown highlighting within `@doc` comments and also Elixir code examples.
- Highlight SQL (e.g. jsonb operators) inside the Ecto `fragment()` function but also inside `sql("INSERT INTO ...")`.
- Git merge conflicts are highlighted.
- Added Monokai and Mariana theme color scheme rules.
- Correct scope for symbol names for the "Goto Definition" command.
- Speed optimizations: rules and regexps are ordered in such a way
  that they match the most likely occurring tokens first.
- Snippets for `|> IO.inspect(label: "...")`, `|> then()` and `|> tap()`.
- Extensive test-suite containing countless checks to ensure quality and avoid regressions.
- Fixed Github CI syntax tests job.

## [v1.7.0] – 2020-05-20

Thanks @dkarter
- Allow leex file to be picked up

## [v1.6.0] – 2019-11-20

Thanks to @azizk again
- We now have regex syntax highlighting
- EEx syntax highlighting now reuses html definition and interpolates Elixir parts into it
- various fixes on general Elixir syntax definition
- comprehensive sublime syntax tests

## [v1.3.0] – 2019-03-22

Thanks to @azizk
- Also apply syntax to files with elixirc and iex in hashbang
- Module names can only have ASCII letters, fixed regex to do that
- Highlight module names as normal atoms when found in map/kwlist keys
- Highlight unicode identifers for atoms, variables and function names

## [v1.2.0] – 2019-02-13

- Add Comment so we don't need https://github.com/elixir-editors/elixir-tmbundle alongside

## [v1.1.3] – 2019-02-01

- Fix binary `^^^` highlight
- Highlight more operators

## [v1.1.0] – 2017-12-13

- Add HTML (EEX)
