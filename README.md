# ExPygments

Syntax highlight using [Pygments](http://pygments.org)

## Preinstall

ExPygments requires python3 `pygments` package in able to work.

```sh
pip3 install pygments
```

## Installation

```elixir
{:pygments, "~> 1.0"}
```

## Usage

```elixir
# highlight(source, language \\ "text")
html = Pygments.highlight("defmodule Bar do\nend\n", "elixir")

# For source code parsed through a markdown engine:
# highlight_escaped(source, language)
html = Pygments.highlight_escaped("&lt;tag&gt;", "html")
```

## License

UNLICENSE
