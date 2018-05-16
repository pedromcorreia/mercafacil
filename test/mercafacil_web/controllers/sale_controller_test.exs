defmodule MercafacilWeb.SaleControllerTest do
  use MercafacilWeb.ConnCase

  alias Mercafacil.Store

  @create_attrs %{cashier_number: 42, client_1: 42, client_2: 42, date: ~D[2010-04-17], id_sale: 42, id_store: 42, time: ~T[14:00:00.000000], value_discount: 120.5, value_total_with_discount: 120.5, value_total_without_discount: 120.5}
  @update_attrs %{cashier_number: 43, client_1: 43, client_2: 43, date: ~D[2011-05-18], id_sale: 43, id_store: 43, time: ~T[15:01:01.000000], value_discount: 456.7, value_total_with_discount: 456.7, value_total_without_discount: 456.7}
  @invalid_attrs %{cashier_number: nil, client_1: nil, client_2: nil, date: nil, id_sale: nil, id_store: nil, time: nil, value_discount: nil, value_total_with_discount: nil, value_total_without_discount: nil}

  def fixture(:sale) do
    {:ok, sale} = Store.create_sale(@create_attrs)
    sale
  end

  describe "index" do
    test "lists all sales", %{conn: conn} do
      conn = get conn, sale_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Sales"
    end
  end

  describe "new sale" do
    test "renders form", %{conn: conn} do
      conn = get conn, sale_path(conn, :new)
      assert html_response(conn, 200) =~ "New Sale"
    end
  end

  describe "create sale" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, sale_path(conn, :create), sale: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == sale_path(conn, :show, id)

      conn = get conn, sale_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Sale"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sale_path(conn, :create), sale: @invalid_attrs
      assert html_response(conn, 200) =~ "New Sale"
    end
  end

  describe "edit sale" do
    setup [:create_sale]

    test "renders form for editing chosen sale", %{conn: conn, sale: sale} do
      conn = get conn, sale_path(conn, :edit, sale)
      assert html_response(conn, 200) =~ "Edit Sale"
    end
  end

  describe "update sale" do
    setup [:create_sale]

    test "redirects when data is valid", %{conn: conn, sale: sale} do
      conn = put conn, sale_path(conn, :update, sale), sale: @update_attrs
      assert redirected_to(conn) == sale_path(conn, :show, sale)

      conn = get conn, sale_path(conn, :show, sale)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, sale: sale} do
      conn = put conn, sale_path(conn, :update, sale), sale: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Sale"
    end
  end

  describe "delete sale" do
    setup [:create_sale]

    test "deletes chosen sale", %{conn: conn, sale: sale} do
      conn = delete conn, sale_path(conn, :delete, sale)
      assert redirected_to(conn) == sale_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, sale_path(conn, :show, sale)
      end
    end
  end

  defp create_sale(_) do
    sale = fixture(:sale)
    {:ok, sale: sale}
  end
end
