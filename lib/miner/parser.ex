defmodule Miner.Parser do

  import CSV
  @chunk_size 20
  @mappings_sale %{
    id_loja: %{type: :integer, local: 0},
    id_venda: %{type: :integer, local: 1},
    numero_caixa: %{type: :integer, local: 2},
    data_venda: %{type: :date, local: 3},
    hora_venda: %{type: :time, local: 4},
    valor_total_sem_desc: %{type: :integer, local: 5},
    valor_desconto: %{type: :integer, local: 6},
    valor_total_com_desc: %{type: :integer, local: 7},
    id_cliente_1: %{type: :integer, local: 8},
    id_cliente_2: %{type: :integer, local: 9}
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
      x =
        x
        |> List.first
        |> String.split(";")
    end)
  end

  def read_map(sale) do
    @mappings_sale
    |> Enum.map(fn({field, %{local: local, type: type}}) ->
      read_field(Enum.at(sale, local), field, type)
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
