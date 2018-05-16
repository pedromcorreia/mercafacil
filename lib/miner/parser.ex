defmodule Miner.Parser do

  alias Mercafacil.Sale
  alias Mercafacil.Auth
  import CSV
  @chunk_size 20

  @mapping_sale %{
    id_store: %{type: :integer, index: 0},
    id_sale: %{type: :integer, index: 1},
    cashier_number: %{type: :integer, index: 2},
    date: %{type: :date, index: 3},
    time: %{type: :time, index: 4},
    value_total_without_discount: %{type: :decimal, index: 5},
    value_discount: %{type: :decimal, index: 6},
    value_total_with_discount: %{type: :decimal, index: 7},
    client_1: %{type: :integer, index: 8},
    client_2: %{type: :integer, index: 9}
  }
  @mapping_sale_item %{
    id_store: %{type: :integer, index: 0},
    id_sale: %{type: :integer , index: 1},
    cashier_number: %{type: :integer, index: 2},
    id_product: %{type: :integer, index: 3},
    quantitie: %{type: :decimal,index: 4},
    value: %{type: :decimal, index: 5},
    value_total_without_discount: %{type: :decimal, index: 6},
    value_discount: %{type: :decimal, index: 7},
    value_total_with_discount: %{type: :decimal, index: 8},
    profissional_1: %{type: :integer, index: 9},
    profissional_2: %{type: :integer, index: 10},
  }

  def parse(path) do
    path
    |> Path.expand(__DIR__)
    |> File.stream!()
    |> CSV.decode!(separator: ?;)
    |> Stream.chunk_every(@chunk_size)
    |> Stream.each(&create_entities(&1))
    |> Enum.to_list
  end

  def create_entities(chunk) do
    chunk
    |> Enum.map(fn(x) ->
      x
      |> List.first
      |> String.split(";")
      |> read_map()
    end)
  end

  def read_map(sale) when length(sale) == 12 do
    @mapping_sale_item
    |> Enum.map(fn({field, %{index: index, type: type}}) ->
      read_field(Enum.at(sale, index), field, type)
    end)
    |> Enum.reduce(fn x, y ->
      Map.merge(x, y, fn _k, v1, v2 -> v2 ++ v1 end)
    end)
    |> create_sale_item()
  end

  def read_map(sale) when length(sale) == 11 do
    @mapping_sale
    |> Enum.map(fn({field, %{index: index, type: type}}) ->
      read_field(Enum.at(sale, index), field, type)
    end)
    |> Enum.reduce(fn x, y ->
      Map.merge(x, y, fn _k, v1, v2 -> v2 ++ v1 end)
    end)
    |> create_sale()
    |> IO.inspect
  end

  defp create_sale_item(item) do
    Mercafacil.Store.create_item(item)
  end

  defp create_sale(sale) do
    Mercafacil.Store.create_sale(sale)
  end

  def read_field(value, field) do
    %{field => value}
  end

  def read_field(value, field, _) when value == ""do
    read_field(nil, field)
  end

  def read_field(value, field, :integer) do
    value
    |> Integer.parse()
    |> elem(0)
    |> read_field(field)
  end

  def read_field(value, field, :date) do
    value
    |> Timex.parse("{D}/{0M}/{YYYY}")
    |> elem(1)
    |> Timex.to_date()
    |> read_field(field)
  end

  def read_field(value, field, :time) do
    value <> ":00"
    |> Time.from_iso8601()
    |> elem(1)
    |> read_field(field)
  end

  def read_field(value, field, :decimal) do
    if String.starts_with?(value, "."), do: value = String.replace(value, ".", "0.")

    value
    |> String.replace("-", "0")
    |> String.replace(",", ".")
    |> Float.parse()
    |> elem(0)
    |> read_field(field)
  end
end
