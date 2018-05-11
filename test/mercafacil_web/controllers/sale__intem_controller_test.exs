defmodule MercafacilWeb.Sale_IntemControllerTest do
  use MercafacilWeb.ConnCase

  alias Mercafacil.Store

  @create_attrs %{quantities: 42}
  @update_attrs %{quantities: 43}
  @invalid_attrs %{quantities: nil}

  def fixture(:sale__intem) do
    {:ok, sale__intem} = Store.create_sale__intem(@create_attrs)
    sale__intem
  end

  describe "index" do
    test "lists all sale_itens", %{conn: conn} do
      conn = get conn, sale__intem_path(conn, :index)
      assert html_response(conn, 200) =~ "Listing Sale itens"
    end
  end

  describe "new sale__intem" do
    test "renders form", %{conn: conn} do
      conn = get conn, sale__intem_path(conn, :new)
      assert html_response(conn, 200) =~ "New Sale  intem"
    end
  end

  describe "create sale__intem" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post conn, sale__intem_path(conn, :create), sale__intem: @create_attrs

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == sale__intem_path(conn, :show, id)

      conn = get conn, sale__intem_path(conn, :show, id)
      assert html_response(conn, 200) =~ "Show Sale  intem"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, sale__intem_path(conn, :create), sale__intem: @invalid_attrs
      assert html_response(conn, 200) =~ "New Sale  intem"
    end
  end

  describe "edit sale__intem" do
    setup [:create_sale__intem]

    test "renders form for editing chosen sale__intem", %{conn: conn, sale__intem: sale__intem} do
      conn = get conn, sale__intem_path(conn, :edit, sale__intem)
      assert html_response(conn, 200) =~ "Edit Sale  intem"
    end
  end

  describe "update sale__intem" do
    setup [:create_sale__intem]

    test "redirects when data is valid", %{conn: conn, sale__intem: sale__intem} do
      conn = put conn, sale__intem_path(conn, :update, sale__intem), sale__intem: @update_attrs
      assert redirected_to(conn) == sale__intem_path(conn, :show, sale__intem)

      conn = get conn, sale__intem_path(conn, :show, sale__intem)
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, sale__intem: sale__intem} do
      conn = put conn, sale__intem_path(conn, :update, sale__intem), sale__intem: @invalid_attrs
      assert html_response(conn, 200) =~ "Edit Sale  intem"
    end
  end

  describe "delete sale__intem" do
    setup [:create_sale__intem]

    test "deletes chosen sale__intem", %{conn: conn, sale__intem: sale__intem} do
      conn = delete conn, sale__intem_path(conn, :delete, sale__intem)
      assert redirected_to(conn) == sale__intem_path(conn, :index)
      assert_error_sent 404, fn ->
        get conn, sale__intem_path(conn, :show, sale__intem)
      end
    end
  end

  defp create_sale__intem(_) do
    sale__intem = fixture(:sale__intem)
    {:ok, sale__intem: sale__intem}
  end
end
