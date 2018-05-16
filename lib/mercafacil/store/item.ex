defmodule Mercafacil.Store.Item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "mitens" do
    field :cashier_number, :integer
    field :id_product, :integer
    field :id_sale, :integer
    field :id_store, :integer
    field :profissional_1, :integer
    field :profissional_2, :integer
    field :quantitie, :float
    field :value, :float
    field :value_discount, :float
    field :value_total_with_discount, :float
    field :value_total_without_discount, :float

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:id_store, :id_sale, :cashier_number, :id_product, :quantitie, :value, :value_total_without_discount, :value_discount, :value_total_with_discount, :profissional_1, :profissional_2])
    |> validate_required([:id_store, :id_sale, :cashier_number, :id_product, :quantitie, :value, :value_total_without_discount, :value_discount, :value_total_with_discount, :profissional_1, :profissional_2])
  end
end
