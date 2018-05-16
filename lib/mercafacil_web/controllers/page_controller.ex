defmodule MercafacilWeb.PageController do
  use MercafacilWeb, :controller

  alias Mercafacil.Store

  def index(conn, _params) do
    total_sell_by_product =
      Store.get_all_sell_by_product()
    total_sell_by_client =
      Store.get_all_sell_by_client()

    total_sell_by_day =
      Store.get_all_sell_by_day()

    render(conn,
           "index.html",
           total_sell_by_product: total_sell_by_product,
           total_sell_by_client: total_sell_by_client,
           total_sell_by_day: total_sell_by_day
    )
  end
end
