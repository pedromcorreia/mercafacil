defmodule ParseTest do
  use Mercafacil.DataCase
  alias Miner.Parser

  describe "Parse/1" do
    test "Parse returns with" do

      path_sales = "~/mercafacil/test/fixtures/vendas.csv"
      path_sales_itens = "~/mercafacil/test/fixtures/vendas_itens.csv"

      #sales_item = Parser.parse(path_sales_itens)

      sales = Parser.parse(path_sales)

      assert Enum.take(sales, 1) |> List.first |> List.first ==
        %{sale: ["002;123343;037;05/03/2017;18:46;65.11;0.00;65.11;0;0;"]}
      assert Enum.take(sales, 1) |> Enum.count == 1
      assert Enum.take(sales, 1) |> List.first |> Enum.count == 20
    end

    test "create_entities" do

      chunk = [
        %{sale: ["002;200177;035;162124;0,254;24.882;6.320;0.000;6.320;0;0;"]}]

      entities = Parser.create_entities(chunk)
      assert entities == [
        [{:id_loja, "002"}, {:id_venda, "200177"}, {:numero_caixa, "035"},
         {:data_venda, "162124"}, {:hora_venda, "0,254"},
         {:valor_total_sem_desc, "24.882"}, {:valor_desconto, "6.320"},
         {:valor_total_com_desc, "0.000"}, {:id_cliente_1, "6.320"},
         {:id_cliente_2, "0"}]]
    end

    test "Read_map/1" do
      sale_test =
        ["004", "165156", "003", "05/03/2017", "09:11", "27.34", "0.52", "26.82", "178764", "0", ""]
      sale = Parser.read_map(sale_test)
      assert sale == [
        %{data_venda: ~D[2017-03-05]},
        %{hora_venda: ~T[09:11:00]},
        %{id_cliente_1: 178764},
        %{id_cliente_2: 0},
        %{id_loja: 4},
        %{id_venda: 165156},
        %{numero_caixa: 3},
        %{valor_desconto: 0},
        %{valor_total_com_desc: 26},
        %{valor_total_sem_desc: 27}
      ]
    end
  end
end
