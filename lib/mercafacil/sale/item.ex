defmodule Mercafacil.Sale.Item do
  use Ecto.Schema
  import Ecto.Changeset


  schema "itens" do
    field :value, :integer
    field :value_discount, :integer
    field :value_total_with_discount, :integer
    field :value_total_without_discount, :integer

    timestamps()
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:value, :value_total_without_discount, :value_discount, :value_total_with_discount])
    |> validate_required([:value, :value_total_without_discount, :value_discount, :value_total_with_discount])
  end
end
