defmodule Mercafacil.Repo.Migrations.CreateSales do
  use Ecto.Migration

  def change do
    create table(:sales) do
      add :data, :date
      add :time, :naive_datetime
      add :value_total_without_discount, :integer
      add :value_discount, :integer
      add :value_total_with_discount, :integer
      add :cashier_number, :integer

      timestamps()
    end

  end
end
