defmodule MercafacilWeb.ItemControllerTest do
  use MercafacilWeb.ConnCase

  alias Mercafacil.Store

  @create_attrs %{cashier_number: 42, id_product: 42, id_sale: 42, id_store: 42, profissional_1: 42, profissional_2: 42, quantitie: 120.5, value: 120.5, value_discount: 120.5, value_total_with_discount: 120.5, value_total_without_discount: 120.5}
  @update_attrs %{cashier_number: 43, id_product: 43, id_sale: 43, id_store: 43, profissional_1: 43, profissional_2: 43, quantitie: 456.7, value: 456.7, value_discount: 456.7, value_total_with_discount: 456.7, value_total_without_discount: 456.7}
  @invalid_attrs %{cashier_number: nil, id_product: nil, id_sale: nil, id_store: nil, profissional_1: nil, profissional_2: nil, quantitie: nil, value: nil, value_discount: nil, value_total_with_discount: nil, value_total_without_discount: nil}

  def fixture(:item) do
    {:ok, item} = Store.create_item(@create_attrs)
    item
  end

  describe "index" do
    test "lists all itens", %{conn: conn} do
      conn = get conn, item_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Itens"
    end
  end

  describe "new item" do
    test "renders form", %{conn: conn} do
      conn = get conn, item_path(conn, :new)
      assert html_response(conn, 200) =~ "New Item"
    end
  end

  describe "create item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, item_path(conn, :create), item: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == item_path(conn, :show, id)

      conn = get conn, item_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Item"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, item_path(conn, :create), item: @invalid_attrs
      assert html_response(conn, 200) =~ "New Item"
    end
  end

  describe "edit item" do
    setup [:create_item]

    test "renders form for editing chosen item", %{conn: conn, item: item} do
      conn = get conn, item_path(conn, :edit, item)
      assert html_response(conn, 200) =~ "Edit Item"
    end
  end

  describe "update item" do
    setup [:create_item]

    test "redirects when data is valid", %{conn: conn, item: item} do
      conn = put conn, item_path(conn, :update, item), item: @update_attrs
      assert redirected_to(conn) == item_path(conn, :show, item)

      conn = get conn, item_path(conn, :show, item)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, item: item} do
      conn = put conn, item_path(conn, :update, item), item: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Item"
    end
  end

  describe "delete item" do
    setup [:create_item]

    test "deletes chosen item", %{conn: conn, item: item} do
      conn = delete conn, item_path(conn, :delete, item)
      assert redirected_to(conn) == item_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, item_path(conn, :show, item)
      end
    end
  end

  defp create_item(_) do
    item = fixture(:item)
    {:ok, item: item}
  end
end
