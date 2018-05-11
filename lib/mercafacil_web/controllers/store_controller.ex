defmodule MercafacilWeb.StoreController do
  use MercafacilWeb, :controller

  alias Mercafacil.Auth
  alias Mercafacil.Auth.Store

  def index(conn, _params) do
    stores = Auth.list_stores()
    render(conn, "index.html", stores: stores)
  end

  def new(conn, _params) do
    changeset = Auth.change_store(%Store{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"store" => store_params}) do
    case Auth.create_store(store_params) do
      {:ok, store} ->
        conn
        |> put_flash(:info, "Store created successfully.")
        |> redirect(to: store_path(conn, :show, store))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    store = Auth.get_store!(id)
    render(conn, "show.html", store: store)
  end

  def edit(conn, %{"id" => id}) do
    store = Auth.get_store!(id)
    changeset = Auth.change_store(store)
    render(conn, "edit.html", store: store, changeset: changeset)
  end

  def update(conn, %{"id" => id, "store" => store_params}) do
    store = Auth.get_store!(id)

    case Auth.update_store(store, store_params) do
      {:ok, store} ->
        conn
        |> put_flash(:info, "Store updated successfully.")
        |> redirect(to: store_path(conn, :show, store))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", store: store, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    store = Auth.get_store!(id)
    {:ok, _store} = Auth.delete_store(store)

    conn
    |> put_flash(:info, "Store deleted successfully.")
    |> redirect(to: store_path(conn, :index))
  end
end
