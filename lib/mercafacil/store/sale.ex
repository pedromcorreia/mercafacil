defmodule Mercafacil.Store.Sale do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sales" do
    field :cashier_number, :integer
    field :data, :date
    field :time, :naive_datetime
    field :value_discount, :integer
    field :value_total_with_discount, :integer
    field :value_total_without_discount, :integer

    timestamps()
  end

  @doc false
  def changeset(sale, attrs) do
    sale
    |> cast(attrs, [:data, :time, :value_total_without_discount, :value_discount, :value_total_with_discount, :cashier_number])
    |> validate_required([:data, :time, :value_total_without_discount, :value_discount, :value_total_with_discount, :cashier_number])
  end
end
