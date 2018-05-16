defmodule Mercafacil.Store.Sale do
  use Ecto.Schema
  import Ecto.Changeset

  schema "msales" do
    field :cashier_number, :integer
    field :client_1, :integer
    field :client_2, :integer
    field :date, :date
    field :id_sale, :integer
    field :id_store, :integer
    field :time, :time
    field :value_discount, :float
    field :value_total_with_discount, :float
    field :value_total_without_discount, :float

    timestamps()
  end

  @doc false
  def changeset(sale, attrs) do
    sale
    |> cast(attrs, [:id_store, :id_sale, :cashier_number, :date, :time, :value_total_without_discount, :value_discount, :value_total_with_discount, :client_1, :client_2])
    |> validate_required([:id_store, :id_sale, :cashier_number, :date, :time, :value_total_without_discount, :value_discount, :value_total_with_discount, :client_1, :client_2])
  end
end
