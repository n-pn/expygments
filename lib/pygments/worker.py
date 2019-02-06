"""Highlight"""

from pygments import highlight
from pygments.formatters import HtmlFormatter
from pygments.lexers import get_lexer_by_name

def get_lexer(lang):
  try:
    return get_lexer_by_name(lang, stripall=True)
  except Exception:
    return get_lexer_by_name('text')

def remove_garbage(html):
  prepend = '<div class="highlight"><pre><span></span>'
  append  = "\n</pre></div>\n"
  return html.replace(prepend, '').replace(append, '')

def call(source, lang):
  # Note: on python 3 erlport converts binary value to bytes(),
  # but pygments get_lexer_by_name expects a str() instead
  html = highlight(source, get_lexer(lang.decode("utf-8")), HtmlFormatter())
  return remove_garbage(html)
