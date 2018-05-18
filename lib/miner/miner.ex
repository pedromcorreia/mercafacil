defmodule Miner do

  alias Miner.Parser

  def run(path) do
    path
    |> Parser.parse()
    |> case do
      :ok -> "Finish miner"
      _ -> "Error"
    end
  end
end
