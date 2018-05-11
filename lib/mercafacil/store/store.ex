defmodule Mercafacil.Store do
  @moduledoc """
  The Store context.
  """

  import Ecto.Query, warn: false
  alias Mercafacil.Repo

  alias Mercafacil.Store.Sale

  @doc """
  Returns the list of sales.

  ## Examples

      iex> list_sales()
      [%Sale{}, ...]

  """
  def list_sales do
    Repo.all(Sale)
  end

  @doc """
  Gets a single sale.

  Raises `Ecto.NoResultsError` if the Sale does not exist.

  ## Examples

      iex> get_sale!(123)
      %Sale{}

      iex> get_sale!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sale!(id), do: Repo.get!(Sale, id)

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
  Updates a sale.

  ## Examples

      iex> update_sale(sale, %{field: new_value})
      {:ok, %Sale{}}

      iex> update_sale(sale, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sale(%Sale{} = sale, attrs) do
    sale
    |> Sale.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sale.

  ## Examples

      iex> delete_sale(sale)
      {:ok, %Sale{}}

      iex> delete_sale(sale)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sale(%Sale{} = sale) do
    Repo.delete(sale)
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

  alias Mercafacil.Store.Sale_Intem

  @doc """
  Returns the list of sale_itens.

  ## Examples

      iex> list_sale_itens()
      [%Sale_Intem{}, ...]

  """
  def list_sale_itens do
    Repo.all(Sale_Intem)
  end

  @doc """
  Gets a single sale__intem.

  Raises `Ecto.NoResultsError` if the Sale  intem does not exist.

  ## Examples

      iex> get_sale__intem!(123)
      %Sale_Intem{}

      iex> get_sale__intem!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sale__intem!(id), do: Repo.get!(Sale_Intem, id)

  @doc """
  Creates a sale__intem.

  ## Examples

      iex> create_sale__intem(%{field: value})
      {:ok, %Sale_Intem{}}

      iex> create_sale__intem(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sale__intem(attrs \\ %{}) do
    %Sale_Intem{}
    |> Sale_Intem.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sale__intem.

  ## Examples

      iex> update_sale__intem(sale__intem, %{field: new_value})
      {:ok, %Sale_Intem{}}

      iex> update_sale__intem(sale__intem, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sale__intem(%Sale_Intem{} = sale__intem, attrs) do
    sale__intem
    |> Sale_Intem.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Sale_Intem.

  ## Examples

      iex> delete_sale__intem(sale__intem)
      {:ok, %Sale_Intem{}}

      iex> delete_sale__intem(sale__intem)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sale__intem(%Sale_Intem{} = sale__intem) do
    Repo.delete(sale__intem)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sale__intem changes.

  ## Examples

      iex> change_sale__intem(sale__intem)
      %Ecto.Changeset{source: %Sale_Intem{}}

  """
  def change_sale__intem(%Sale_Intem{} = sale__intem) do
    Sale_Intem.changeset(sale__intem, %{})
  end
end
