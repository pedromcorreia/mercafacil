defmodule Miner do

  alias Miner.Parser

  def run(path) do
    path
    |> Parser.parse()
  end
end
