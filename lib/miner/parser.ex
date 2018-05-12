defmodule Miner.Parser do

  import CSV
  @chunk_size 20
  @mappings_sale %{
    id_loja: %{type: :integer, index: 0},
    id_venda: %{type: :integer, index: 1},
    numero_caixa: %{type: :integer, index: 2},
    data_venda: %{type: :date, index: 3},
    hora_venda: %{type: :time, index: 4},
    valor_total_sem_desc: %{type: :integer, index: 5},
    valor_desconto: %{type: :integer, index: 6},
    valor_total_com_desc: %{type: :integer, index: 7},
    id_cliente_1: %{type: :integer, index: 8},
    id_cliente_2: %{type: :integer, index: 9}
  }
  @mapping_sale_intem %{
    id_loja: %{type: :integer, index: 0},
    id_venda: %{type: :integer , index: 1},
    numero_caixa: %{type: :integer, index: 2},
    id_produto: %{type: :integer, index: 3},
    quantidade: %{type: :decimal,index: 4},
    valor_unitario: %{type: :decimal, index: 5},
    valor_total_sem_desc: %{type: :decimal, index: 6},
    valor_desconto: %{type: :decimal, index: 7},
    valor_total_com_desc: %{type: :decimal, index: 8},
    valor_total_sem_desc: %{type: :decimal, index: 9},
    id_profissional_1: %{type: :integer, index: 10},
    id_profissional_2: %{type: :integer, index: 11},
  }

  def parse(path) do
    path
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode!(separator: ?;)
    |> Stream.chunk_every(@chunk_size)
    |> Stream.each(&create_entities(&1))
    |> Enum.to_list()
  end

  def create_entities(chunk) do
    chunk
    |> Enum.map(fn(x) ->
      x
      |> List.first
      |> String.split(";")
    end)
  end

  def read_map(sale) do
    @mappings_sale
    |> Enum.map(fn({field, %{index: index, type: type}}) ->
      read_field(Enum.at(sale, index), field, type)
    end)
  end

  defp read_field(value, field) do
    %{field => value}
  end

  defp read_field(value, field, :integer) do
    value
    |> Integer.parse()
    |> elem(0)
    |> read_field(field)
  end

  defp read_field(value, field, :date) do
    value
    |> Timex.parse("{D}/{0M}/{YYYY}")
    |> elem(1)
    |> Timex.to_date()
    |> read_field(field)
  end

  defp read_field(value, field, :time) do
    value <> ":00"
    |> Time.from_iso8601()
    |> elem(1)
    |> read_field(field)
  end
end
