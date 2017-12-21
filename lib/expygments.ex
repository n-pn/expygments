defmodule ExPygments do
  @moduledoc """
  Syntax highlight using Pygments.
  """

  use Application

  @doc """
  Start the application.
  """
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(ExPygments.Worker, [ExPygments.Worker])
    ]

    opts = [strategy: :one_for_one, name: ExPygments.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @doc """
  Highlight source code.
  """
  def highlight(source, language \\ "text") do
    GenServer.call(ExPygments.Worker, {:highlight, source, language}, :infinity)
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
