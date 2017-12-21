# ExPygments

Syntax hightlight using [Pygments](http://pygments.org)

## Preinstall

ExPygments requires python3 `pygments` package in able to work.
```sh
pip install pygments
```

## Installation

```elixir
{:expygments, github: "nipinium/expygments"}
```

## Usage

```elixir
# highlight(source, language \\ "text")
html = ExPygments.highlight("defmodule Bar do\nend\n", "elixir")

# For source code parsed through a markdown engine:
# highlight_escaped(source, language)
html = ExPygments.highlight_escaped("&lt;tag&gt;", "html")
```

## License

UNLICENSE
