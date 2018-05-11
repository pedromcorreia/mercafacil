defmodule MercafacilWeb.Sale_IntemController do
  use MercafacilWeb, :controller

  alias Mercafacil.Store
  alias Mercafacil.Store.Sale_Intem

  def index(conn, _params) do
    sale_itens = Store.list_sale_itens()
    render(conn, "index.html", sale_itens: sale_itens)
  end

  def new(conn, _params) do
    changeset = Store.change_sale__intem(%Sale_Intem{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"sale__intem" => sale__intem_params}) do
    case Store.create_sale__intem(sale__intem_params) do
      {:ok, sale__intem} ->
        conn
        |> put_flash(:info, "Sale  intem created successfully.")
        |> redirect(to: sale__intem_path(conn, :show, sale__intem))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sale__intem = Store.get_sale__intem!(id)
    render(conn, "show.html", sale__intem: sale__intem)
  end

  def edit(conn, %{"id" => id}) do
    sale__intem = Store.get_sale__intem!(id)
    changeset = Store.change_sale__intem(sale__intem)
    render(conn, "edit.html", sale__intem: sale__intem, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sale__intem" => sale__intem_params}) do
    sale__intem = Store.get_sale__intem!(id)

    case Store.update_sale__intem(sale__intem, sale__intem_params) do
      {:ok, sale__intem} ->
        conn
        |> put_flash(:info, "Sale  intem updated successfully.")
        |> redirect(to: sale__intem_path(conn, :show, sale__intem))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", sale__intem: sale__intem, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sale__intem = Store.get_sale__intem!(id)
    {:ok, _sale__intem} = Store.delete_sale__intem(sale__intem)

    conn
    |> put_flash(:info, "Sale  intem deleted successfully.")
    |> redirect(to: sale__intem_path(conn, :index))
  end
end
