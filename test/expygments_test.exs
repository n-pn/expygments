defmodule ExPygmentsTest do
  use ExUnit.Case
  doctest ExPygments

  @source "text"
  @lang @source
  @output @source
  test "it works" do
    assert ExPygments.highlight(@source, @lang) == @output
  end

  @source "こんにちは"
  @output @source
  test "support unicode" do
    assert ExPygments.highlight(@source, @lang) == @output
  end

  @lang "802452"
  test "fallback to plain text for unknown lexer" do
    assert ExPygments.highlight(@source, @lang) == @output
  end

  @source "<text>"
  @lang "html"
  @output ~S{<span class="p">&lt;</span><span class="nt">text</span><span class="p">&gt;</span>}
  test "highlight source code" do
    assert ExPygments.highlight(@source, @lang) == @output
  end

  @source "&lt;tag&gt;"
  test "highlight escaped" do
    assert ExPygments.highlight_escaped(@source, "text") == @source
  end
end
