defmodule Mercafacil.Repo.Migrations.CreateSaleItens do
  use Ecto.Migration

  def change do
    create table(:sale_itens) do
      add :quantities, :integer

      timestamps()
    end

  end
end
