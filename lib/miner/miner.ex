defmodule Miner do

  alias Miner.Parser

  def run(path) do
    IO.puts "A"
    path
    |> Parser.parse()
  end
end
