defmodule Mercafacil.Store.Sale_Intem do
  use Ecto.Schema
  import Ecto.Changeset


  schema "sale_itens" do
    field :quantities, :integer

    timestamps()
  end

  @doc false
  def changeset(sale__intem, attrs) do
    sale__intem
    |> cast(attrs, [:quantities])
    |> validate_required([:quantities])
  end
end
