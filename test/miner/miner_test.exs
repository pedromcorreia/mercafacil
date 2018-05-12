defmodule MinerTest do
  alias Miner
  use Mercafacil.DataCase

  describe "Miner/1" do
    test "Run test" do

      path_sales = "~/mercafacil/test/fixtures/vendas.csv"
      path_sales_itens = "~/mercafacil/test/fixtures/vendas_itens.csv"

      #Miner.run(path_sales)
      #Miner.run(path_sales_itens)
    end
  end
end
