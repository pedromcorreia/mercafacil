defmodule ParseTest do
  use Mercafacil.DataCase
  alias Miner.Parser

  describe "Parse/1" do
    test "Parse returns with" do

      path_sales = "~/mercafacil/test/fixtures/vendas.csv"
      path_sales_itens = "~/mercafacil/test/fixtures/vendas_itens.csv"

      sales_item = Parser.parse(path_sales_itens)

      sales = Parser.parse(path_sales)

      assert Enum.take(sales_item, 1) |> List.first |> List.first ==
        ["002;046279;030;10402;0,664;11.898;7.900;0.000;7.900;0;0;"]

        assert Enum.take(sales, 1) |> List.first |> List.first ==
        ["002;123343;037;05/03/2017;18:46;65.11;0.00;65.11;0;0;"]
    end

    test "create_entities" do

      chunk = [["002;200177;035;162124;0,254;24.882;6.320;0.000;6.320;0;0;"]]

      entities = Parser.create_entities(chunk)
      assert entities == [[
        %{cashier_number: 35}, %{id_produt: 162124}, %{id_sale: 200177}, %{id_store: 2}, %{profissional_1: 0}, %{profissional_2: 0}, %{quantitie: 0.254}, %{value: 24.882}, %{value_discount: 0.0}, %{value_total_with_discount: 6.32}, %{value_total_without_discount: 6.32}]]
    end

    test "Read_map/1" do
      sale_test =
        ["004", "165156", "003", "05/03/2017", "09:11", "27,34", "0.52", "26.82", "178764", "0", ""]
      sale = Parser.read_map(sale_test)
      assert sale ==
        %{
      }
    end
  end
end
