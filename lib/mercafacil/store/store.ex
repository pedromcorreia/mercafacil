defmodule Mercafacil.Store do
  @moduledoc """
  The Store context.
  """

  import Ecto.Query
  alias Mercafacil.Repo

  alias Mercafacil.Store.Sale

  @doc """
  Creates a sale.

  ## Examples

  iex> create_sale(%{field: value})
  {:ok, %Sale{}}

  iex> create_sale(%{field: bad_value})
  {:error, %Ecto.Changeset{}}

  """
  def create_sale(attrs \\ %{}) do
    %Sale{}
    |> Sale.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sale changes.

  ## Examples

  iex> change_sale(sale)
  %Ecto.Changeset{source: %Sale{}}

  """
  def change_sale(%Sale{} = sale) do
    Sale.changeset(sale, %{})
  end

  alias Mercafacil.Store.Item

  @doc """
  Creates a item.

  ## Examples

  iex> create_item(%{field: value})
  {:ok, %Item{}}

  iex> create_item(%{field: bad_value})
  {:error, %Ecto.Changeset{}}

  """
  def create_item(attrs \\ %{}) do
    %Item{}
    |> Item.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking item changes.

  ## Examples

  iex> change_item(item)
  %Ecto.Changeset{source: %Item{}}

  """
  def change_item(%Item{} = item) do
    Item.changeset(item, %{})
  end

  def get_all_sell_by_product() do
    from(i in Item,
         group_by: i.id_product,
         order_by: i.id_product,
         select: {i.id_product, count(i.id)})
         |> Repo.all
  end

  def get_all_sell_by_client() do
    from(s in Sale,
         group_by: s.client_1,
         order_by: s.client_1,
         select: {s.client_1, count(s.id)})
         |> Repo.all
  end

  def get_all_sell_by_day() do
    from(s in Sale,
         group_by: s.date,
         order_by: s.date,
         select: {s.date, count(s.id)})
         |> Repo.all
  end

  def get_average_ticket_by_client() do
    from(s in Sale,
         group_by: s.client_1,
         group_by: s.date,
         select: {s.value_total_with_discount, s.id})
         |> Repo.all
  end
end
