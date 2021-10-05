# ElixirSyntax

ElixirSyntax was initially based on the [Elixir.tmbundle package](https://github.com/elixir-editors/elixir-tmbundle) but has been rewritten since, providing more accurate syntax matching as well as better syntax highlighting.

## Features

* Working `Goto Definition` command.
* HTML template highlighting:
  - HEEx: <img src="images/elixir_heex_example.svg" width="260" align="top">
  - Surface: <img src="images/elixir_surface_example.svg" width="215" align="top">
  - LiveView: <img src="images/elixir_liveview_example.svg" width="230" align="top">
* Full PCRE syntax highlighting: <img src="images/elixir_regex_example.svg" width="270" align="top">
* Type highlighting: <img src="images/elixir_type_example.svg" width="620" align="top">
* Theme adaptations for Mariana and Monokai.
* Build commands: `mix format`, `mix test`, `elixir $file`
* Snippets for `IO.inspect`, `tap` and `then`.

Some highlighting features are not immediately evident. Among them are:

### The `fragment` and `sql` functions

SQL syntax is highlighted inside Ecto's `fragment` macro.

<blockquote>
<img src="images/elixir_fragment_example.svg" width="100%">
</blockquote>

Add an `sql` macro/function to your project to enjoy SQL highlighting anywhere it's used.

<blockquote>
<img src="images/elixir_sql_example.svg" width="100%">
</blockquote>

### The JSON `~j` and `~J` sigils ([`Jason`](https://github.com/michalmuskala/jason/blob/ec2042e4e47442bf3d58410934b8e8f6ff850b3f/lib/sigil.ex))

Embed JSON strings in your Elixir code. Notice the interpolated Elixir code is colored correctly.

<blockquote>
<img src="images/elixir_json_example.svg" width="100%">
</blockquote>

### The YAML `~y` and `~Y` sigils ([`YamlElixir`](https://hexdocs.pm/yaml_elixir/YamlElixir.Sigil.html#sigil_y/2))

<blockquote>
<img src="images/elixir_yaml_example.svg" width="100%">
</blockquote>

## Recommended packages

* [LSP](https://packagecontrol.io/packages/LSP) and [LSP-elixir](https://packagecontrol.io/packages/LSP-elixir) for intelligent code completion.

## Changes

See [CHANGELOG.md](./CHANGELOG.md) for the list of releases and noteworthy changes.

## Contributors/Maintainers

- [@azizk](https://github.com/azizk) rewrote the whole syntax definition with an extensive test-suite and added a wealth of new features. ⭐
- [@princemaple](https://github.com/princemaple) initially brought the tm-syntax to sublime-syntax and made some improvements.
