defmodule Pygments.Worker do
  use GenServer

  def init(opts), do: {:ok, opts}

  def start_link(_default) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  @python_path String.to_charlist(__DIR__)
  @python String.to_charlist(case :os.type() do
    {:unix, :linux} -> "python3"
    {:win32, :nt} -> "python.exe"
    _ -> "python"
  end)

  def handle_call(args, from, nil) do
    {:ok, pip} = :python.start([python_path: @python_path, python: @python])
    handle_call(args, from, pip)
  end

  def handle_call({:highlight, source, language}, _from, pip) do
    html = :python.call(pip, :worker, :call, [source, language])
    {:reply, to_string(html), pip}
  end
end
