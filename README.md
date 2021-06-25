# ElixirSyntax

ElixirSyntax was initially based on the [Elixir.tmbundle package](https://github.com/elixir-editors/elixir-tmbundle) but has been rewritten since, providing more accurate syntax matching as well as better syntax highlighting.

## Features

* Working `Goto Definition` functionality
* LiveView template highlighting: `~L"..."`\
  (Note: will be changed to the new HEEx syntax eventually.)
* Full PCRE syntax highlighting: <img src="images/elixir_regex_example.svg" width="270" align="top">
* Type highlighting: <img src="images/elixir_type_example.svg" width="620" align="top">

Some of the other provided features are not immediately evident. Among them are:

### The `fragment` and `sql` functions

SQL syntax is highlighted inside Ecto's `fragment` macro.

<blockquote>
<img src="images/elixir_fragment_example.svg" width="100%">
</blockquote>

Add an `sql` macro/function to your project to enjoy SQL highlighting anywhere it's used.

<blockquote>
<img src="images/elixir_sql_example.svg" width="100%">
</blockquote>

### The JSON `~j` and `~J` sigils

Embed JSON strings in your Elixir code. Notice the interpolated Elixir code is colored correctly.

<blockquote>
<img src="images/elixir_json_example.svg" width="100%">
</blockquote>

### The YAML `~y` and `~Y` sigils

<blockquote>
<img src="images/elixir_yaml_example.svg" width="100%">
</blockquote>

## Changes

See [CHANGELOG.md](./CHANGELOG.md) for the list of releases and noteworthy changes.

## Contributors/Maintainers

- [@azizk](https://github.com/azizk) rewrote the whole syntax definition with an extensive test-suite and added a wealth of new features. ⭐
- [@princemaple](https://github.com/princemaple) initially brought the tm-syntax to sublime-syntax and made some improvements.
