# elixir-sublime-syntax

Elixir Sublime Syntax based on [Elixir Package](https://github.com/elixir-editors/elixir-tmbundle)
with better highlighting and syntax parsing


#### 2020-05-20

Thanks @dkarter
- Allow leex file to be picked up

#### 2019-11-20

Thanks to @azizk again
- We now have regex syntax highlighting
- EEx syntax highlighting now reuses html definition and interpolates Elixir parts into it
- various fixes on general Elixir syntax definition
- comprehensive sublime syntax tests

#### 2019-03-22

Thanks to @azizk
- Also apply syntax to files with elixirc and iex in hashbang
- Module names can only have ASCII letters, fixed regex to do that
- Highlight module names as normal atoms when found in map/kwlist keys
- Highlight unicode identifers for atoms, variables and function names

#### 2019-02-13

- Add Comment so we don't need https://github.com/elixir-editors/elixir-tmbundle alongside

#### 2019-02-01

- Fix binary `^^^` highlight
- Highlight more operators

#### 2017-12-13

- Add HTML (EEX)

#### Initially

- Transformed tm syntax into sublime syntax automatically
- Refactored syntax definition into reusable blocks
- Removed Ruby leftovers
- Rewrote Binary definition so it highlights correctly
- Fixed operator matching so they are displayed correctly on Sublime 3147 with fonts that has ligature support
