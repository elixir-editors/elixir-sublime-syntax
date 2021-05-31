# ElixirSyntax

ElixirSyntax was initially based on the [Elixir.tmbundle package](https://github.com/elixir-editors/elixir-tmbundle) but has been rewritten since, providing more accurate syntax matching as well as better syntax highlighting.

## Changes

See [CHANGELOG.md](./CHANGELOG.md) for the list of releases and noteworthy changes.

## Features

Some of the provided features are not immediately evident. Among them are:

### The `fragment` and `sql` functions

SQL syntax is highlighted inside Ecto's `fragment` macro.

<blockquote><span class="mod">Post</span>
<span class="kw">|></span> <span class="fnc">where</span>([post], <span class="fnc">fragment</span>(<span class="str_dlm">"</span><span class="prpl">?</span>.full_text <span class="kw">&lt;@</span> <span class="fnc">to_tsquery</span>(<span class="prpl">?</span>)<span class="str_dlm">"</span>, post, terms))
</blockquote>

Add an `sql` macro/function to your project to enjoy SQL highlighting anywhere it's used.

<blockquote><span class="blu_i">defmacro</span> <span class="entity">sql</span>(<span class="param">sql</span>), <span class="akw">do</span><span class="colon">:</span> sql
<span class="fnc">sql</span>(<span class="str_dlm">"</span><span class="kw">SELECT</span> <span class="param">*</span> <span class="kw">FROM</span> posts <span class="kw">ORDER</span> <span class="kw">BY</span> title <span class="kw">GROUP</span> <span class="kw">BY</span> user_id<span class="str_dlm">"</span>)
</blockquote>

### The JSON `~j` and `~J` sigils

Embed JSON strings in your Elixir code. (Notice the interpolated Elixir code is rendered properly.)

<blockquote><span class="blu_i">~j</span><span class="str_dlm">"""</span>
{
  <span class="str_dlm">"</span><span class="str">key</span><span class="str_dlm">"</span>: <span class="str_dlm">"</span><span class="intp_dlm">#{</span><span class="intp_bg">value</span><span class="intp_dlm">}</span><span class="str_dlm">"</span>,
  <span class="str_dlm">"</span><span class="intp_dlm">#{</span><span class="intp_bg">key</span><span class="intp_dlm">}</span><span class="str_dlm">"</span>: <span class="str_dlm">"</span><span class="str">value</span><span class="str_dlm">"</span>
}
<span class="str_dlm">"""</span>
</blockquote>

### The YAML `~y` and `~Y` sigils

<blockquote><span class="blu_i">~Y</span><span class="str_dlm">"""</span>
<span class="kw">user</span>:
  <span class="kw">name</span>: <span class="str">YAML</span>
  <span class="kw">born</span>: <span class="prpl">2001</span><span class="prpl">-</span><span class="prpl">05</span><span class="prpl">-</span><span class="prpl">11</span>
<span class="str_dlm">"""</span>
</blockquote>

### Etc.

Also supported are LiveView (`~L"..."`) and the full PCRE syntax (`~r"..."`).

## Contributors/Maintainers

- [@azizk](https://github.com/azizk) rewrote the whole syntax definition with an extensive test-suite and added a wealth of new features. ⭐
- [@princemaple](https://github.com/princemaple) initially brought the tm-syntax to sublime-syntax and made some improvements.
