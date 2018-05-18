defmodule Watcher do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, [dirs: ["./test/fixtures/"]])
  end

  def init(args) do
    {:ok, watcher_pid} = FileSystem.start_link(args)
    FileSystem.subscribe(watcher_pid)
    {:ok, %{watcher_pid: watcher_pid}}
  end

  def handle_info({:file_event, watcher_pid, {path, events}}, %{watcher_pid: watcher_pid}=state) do
    if Enum.member?(events, :modified) do
      path |> normalize |> reload
    end
    {:noreply, state}
  end

  defp reload(path) do
    IO.inspect "New file added"
    if Path.extname(path) == ".csv" do
      try do
        run = Miner.run(path)
        IO.inspect(run <> path)
      rescue
        e -> IO.inspect(e <> path)
      end
    else
      IO.inspect "File Extention not supported"
    end
  end

  defp normalize(file) do
    String.replace_suffix(file, "___jb_tmp___", "")
  end
end
