defmodule MinerTest do
  alias Miner
  use Mercafacil.DataCase

  describe "Miner/1" do
    test "Run test" do

      path_sales = "~/mercafacil/test/fixtures/vendas.csv"
      path_sales_itens = "~/mercafacil/test/fixtures/vendas_itens.csv"

      sales_test = Miner.run(path_sales)
      sales_item_test = Miner.run(path_sales_itens)
      assert sales_test == ""
    end
  end
end
