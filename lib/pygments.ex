defmodule Pygments do
  @moduledoc """
  Syntax highlight using Pygments.
  """

  use Application

  @doc """
  Start the application.
  """
  def start(_type, _args) do
    opts = [strategy: :one_for_one, name: Pygments.Supervisor]
    Supervisor.start_link([ Pygments.Worker ], opts)
  end

  @doc """
  Highlight source code.
  """
  def highlight(source, language \\ "text") do
    GenServer.call(Pygments.Worker, {:highlight, source, language}, :infinity)
  end

  @doc """
  Highlight source code parsed through a markdown engine.
  """
  def highlight_escaped(source, language \\ "text") do
    source
    |> String.replace("&lt;", "<")
    |> String.replace("&gt;", ">")
    |> highlight(language)
  end
end
