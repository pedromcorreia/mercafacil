defmodule Mercafacil.Repo.Migrations.CreateItens do
  use Ecto.Migration

  def change do
    create table(:itens) do
      add :value, :integer
      add :value_total_without_discount, :integer
      add :value_discount, :integer
      add :value_total_with_discount, :integer

      timestamps()
    end

  end
end
