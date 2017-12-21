defmodule ExPygments.Worker do
  use GenServer

  def start_link(_default) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def handle_call(args, from, nil) do
    opts = [python_path: String.to_charlist(__DIR__)]
    {:ok, pip} = :python.start(opts)
    handle_call(args, from, pip)
  end

  def handle_call({:highlight, source, language}, _from, pip) do
    html = :python.call(pip, :worker, :call, [source, language])
    {:reply, to_string(html), pip}
  end
end
