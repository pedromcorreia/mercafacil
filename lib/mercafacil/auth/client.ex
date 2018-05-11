defmodule Mercafacil.Auth.Client do
  use Ecto.Schema
  import Ecto.Changeset


  schema "clients" do
    field :name, :string
    field :user_type, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :user_type])
    |> validate_required([:name, :user_type])
  end
end
