# ElixirSyntax

*ElixirSyntax* was initially based on the [Elixir.tmbundle package](https://github.com/elixir-editors/elixir-tmbundle) but has been rewritten since, providing more accurate syntax matching as well as better syntax highlighting.

## Features

* Working `Goto Definition` command.
* HTML template highlighting:
  - HEEx: <img src="images/elixir_heex_example.svg" height="28" align="top">
  - Surface: <img src="images/elixir_surface_example.svg" height="28" align="top">
  - LiveView: <img src="images/elixir_liveview_example.svg" height="28" align="top">
* Full PCRE syntax highlighting: <img src="images/elixir_regex_example.svg" height="28" align="top">
* Type highlighting: <img src="images/elixir_type_example.svg" height="28" align="top">
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

### The JSON `~j` and `~J` sigils ([`Jason`](https://github.com/michalmuskala/jason/blob/master/lib/sigil.ex))

Embed JSON strings in your Elixir code. Notice the interpolated Elixir code is colored correctly.

<blockquote>
<img src="images/elixir_json_example.svg" width="100%">
</blockquote>

### The YAML `~y` and `~Y` sigils ([`YamlElixir`](https://hexdocs.pm/yaml_elixir/YamlElixir.Sigil.html#sigil_y/2))

<blockquote>
<img src="images/elixir_yaml_example.svg" width="100%">
</blockquote>

## Testing

Build-files as well as commands are provided for calling `mix test`. The predefined shortcuts can be changed via `Preferences > Package Settings > ElixirSyntax > Key Bindings`.

Tip: To run specific tests in the current file, mark them with multiple cursors and/or spanning selections and press `Alt+Shift+T` or choose `Mix Test: Selection(s)` from the palette.

*ElixirSyntax* stores a per-project JSON settings file in the root folder that contains both the `mix.exs` file and the `_build/` folder. They override the general settings below.

General settings example (via `Preferences > Package Settings > ElixirSyntax > Settings`):
```json
{
  "mix_test": {
    "output": "tab",
    "output_mode": null,
    "output_scroll_time": 2,
    "args": ["--coverage"],
    "seed": null
  }
}
```

When a `mix test` command is run the first time, a `mix_test.repeat.json` file is stored in the `_build/` folder to remember the command arguments. By pressing `Alt+Shift+R` or running `Mix Test: Repeat` from the palette you can repeat the previously executed tests.

## Formatting

Use the default shortcut `Alt+Shift+F` or the palette command `Mix Format: File` to format your Elixir code. Format the whole project via `Mix Format: Project / Folder`. Configure auto-formatting on save via the palette command `Mix Format: Toggle Auto-Formatting` or via the menu `Preferences > Package Settings > ElixirSyntax > Settings`. There is no per-project auto-format setting yet.

```json
{
  "mix_format": {
    "on_save": true
  }
}
```

## Palette commands

- `ElixirSyntax: Settings`
- `Mix Test: Settings`
- `Mix Test: File`
- `Mix Test: Selection(s)`
- `Mix Test: Failed`
- `Mix Test: Repeat`
- `Mix Test: Set Seed`
- `Mix Test: Toggle --stale Flag`
- `Mix Format: File`
- `Mix Format: Project / Folder`
- `Mix Format: Toggle Auto-Formatting`

## Recommended packages

* [LSP](https://packagecontrol.io/packages/LSP) and [LSP-elixir](https://packagecontrol.io/packages/LSP-elixir) for intelligent code completion and additional snippet suggestions.

## Changes

See [CHANGELOG.md](./CHANGELOG.md) for the list of releases and noteworthy changes.

## FAQ

- How to color unused variables, e.g. `_opts`, differently?

  You can [customize the color](https://user-images.githubusercontent.com/1329716/152258038-384c6a61-d974-4e9a-a1db-ab979c839ff7.png) of unused variable names by extending your color scheme, targeting the `variable.parameter.unused` and `variable.other.unused` scopes:

  ```json
  {
    "rules": [
      {
        "name": "Unused variables",
        "scope": "variable.parameter.unused, variable.other.unused",
        "foreground": "#8c8cff"
      }
    ]
  }
  ```

  More details at [Sublime Text Docs](https://www.sublimetext.com/docs/color_schemes.html)

## Contributors/Maintainers

- [@azizk](https://github.com/azizk) rewrote the whole syntax definition with an extensive test-suite and added a wealth of new features. ⭐
- [@princemaple](https://github.com/princemaple) initially brought the tm-syntax to sublime-syntax and made some improvements.
