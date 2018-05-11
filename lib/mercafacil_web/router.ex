defmodule MercafacilWeb.Router do
  use MercafacilWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MercafacilWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/stores", StoreController
    resources "/clients", ClientController
    resources "/sales", SaleController
    resources "/itens", ItemController
    resources "/sale_itens", Sale_IntemController

  end

  # Other scopes may use custom stacks.
  # scope "/api", MercafacilWeb do
  #   pipe_through :api
  # end
end
