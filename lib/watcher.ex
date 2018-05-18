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
    if Path.extname(path) == ".csv" do
      Miner.run(path)
    end
  end

  defp normalize(file) do
    String.replace_suffix(file, "___jb_tmp___", "")
  end
end