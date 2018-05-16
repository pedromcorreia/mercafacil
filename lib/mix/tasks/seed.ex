defmodule Mix.Tasks.Seed do

  use Mix.Task
  import Mix.Ecto

  def run(_args) do

    ensure_started(Mercafacil.Repo, [])
      path_sales = "~/mercafacil/test/fixtures/vendas_short.csv"
      path_sales_itens = "~/mercafacil/test/fixtures/vendas_itens_short.csv"

    Miner.run(path_sales_itens)
    Miner.run(path_sales)
  end
end
