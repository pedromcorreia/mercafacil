defmodule Mercafacil.Repo.Migrations.CreateItens do
  use Ecto.Migration

  def change do
    create table(:mitens) do
      add :id_store, :integer
      add :id_sale, :integer
      add :cashier_number, :integer
      add :id_product, :integer
      add :quantitie, :float
      add :value, :float
      add :value_total_without_discount, :float
      add :value_discount, :float
      add :value_total_with_discount, :float
      add :profissional_1, :integer
      add :profissional_2, :integer

      timestamps()
    end

  end
end
