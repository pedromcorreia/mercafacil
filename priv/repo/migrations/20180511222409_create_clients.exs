defmodule Mercafacil.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :user_type, :string

      timestamps()
    end

  end
end
