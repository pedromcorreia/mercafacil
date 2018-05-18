defmodule MercafacilWeb.PageController do
  use MercafacilWeb, :controller

  alias Mercafacil.Store

  def index(conn, _params) do
    list_result = []
    render(conn, "index.html", list_result: list_result)
  end

  def show(conn, %{"id" => attrs} = params) do
    list_result =
      attrs
      |> case do
        "total_sell_by_product" -> Store.get_all_sell_by_product()
        "total_sell_by_client" -> Store.get_all_sell_by_client()
        "total_sell_by_day" -> Store.get_all_sell_by_day()
        _ -> []
      end
    list_result
    |> IO.inspect
    render(conn, "index.html", list_result: list_result)
  end
end
