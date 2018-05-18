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
    pipe_through :browser
    resources "/", PageController, only: [:index, :show]
  end
end
