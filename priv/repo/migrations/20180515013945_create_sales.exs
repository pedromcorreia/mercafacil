defmodule Mercafacil.Repo.Migrations.CreateSales do
  use Ecto.Migration

  def change do
    create table(:msales) do
      add :id_store, :integer
      add :id_sale, :integer
      add :cashier_number, :integer
      add :date, :date
      add :time, :time
      add :value_total_without_discount, :float
      add :value_discount, :float
      add :value_total_with_discount, :float
      add :client_1, :integer
      add :client_2, :integer

      timestamps()
    end

  end
end
