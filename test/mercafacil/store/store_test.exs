defmodule Mercafacil.StoreTest do
  use Mercafacil.DataCase

  alias Mercafacil.Store

  describe "sales" do
    alias Mercafacil.Store.Sale

    @valid_attrs %{cashier_number: 42, data: ~D[2010-04-17], time: ~N[2010-04-17 14:00:00.000000], value_discount: 42, value_total_with_discount: 42, value_total_without_discount: 42}
    @update_attrs %{cashier_number: 43, data: ~D[2011-05-18], time: ~N[2011-05-18 15:01:01.000000], value_discount: 43, value_total_with_discount: 43, value_total_without_discount: 43}
    @invalid_attrs %{cashier_number: nil, data: nil, time: nil, value_discount: nil, value_total_with_discount: nil, value_total_without_discount: nil}

    def sale_fixture(attrs \\ %{}) do
      {:ok, sale} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_sale()

      sale
    end

    test "list_sales/0 returns all sales" do
      sale = sale_fixture()
      assert Store.list_sales() == [sale]
    end

    test "get_sale!/1 returns the sale with given id" do
      sale = sale_fixture()
      assert Store.get_sale!(sale.id) == sale
    end

    test "create_sale/1 with valid data creates a sale" do
      assert {:ok, %Sale{} = sale} = Store.create_sale(@valid_attrs)
      assert sale.cashier_number == 42
      assert sale.data == ~D[2010-04-17]
      assert sale.time == ~N[2010-04-17 14:00:00.000000]
      assert sale.value_discount == 42
      assert sale.value_total_with_discount == 42
      assert sale.value_total_without_discount == 42
    end

    test "create_sale/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_sale(@invalid_attrs)
    end

    test "update_sale/2 with valid data updates the sale" do
      sale = sale_fixture()
      assert {:ok, sale} = Store.update_sale(sale, @update_attrs)
      assert %Sale{} = sale
      assert sale.cashier_number == 43
      assert sale.data == ~D[2011-05-18]
      assert sale.time == ~N[2011-05-18 15:01:01.000000]
      assert sale.value_discount == 43
      assert sale.value_total_with_discount == 43
      assert sale.value_total_without_discount == 43
    end

    test "update_sale/2 with invalid data returns error changeset" do
      sale = sale_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_sale(sale, @invalid_attrs)
      assert sale == Store.get_sale!(sale.id)
    end

    test "delete_sale/1 deletes the sale" do
      sale = sale_fixture()
      assert {:ok, %Sale{}} = Store.delete_sale(sale)
      assert_raise Ecto.NoResultsError, fn -> Store.get_sale!(sale.id) end
    end

    test "change_sale/1 returns a sale changeset" do
      sale = sale_fixture()
      assert %Ecto.Changeset{} = Store.change_sale(sale)
    end
  end

  describe "itens" do
    alias Mercafacil.Store.Item

    @valid_attrs %{cashier_number: "some cashier_number", float: "some float", id_product: "some id_product", id_sale: "some id_sale", id_store: "some id_store", integer: "some integer", profissional_1: "some profissional_1", profissional_2: "some profissional_2", quantitie: "some quantitie", value: "some value", value_discount: "some value_discount", value_total_with_discount: "some value_total_with_discount", value_total_without_discount: "some value_total_without_discount"}
    @update_attrs %{cashier_number: "some updated cashier_number", float: "some updated float", id_product: "some updated id_product", id_sale: "some updated id_sale", id_store: "some updated id_store", integer: "some updated integer", profissional_1: "some updated profissional_1", profissional_2: "some updated profissional_2", quantitie: "some updated quantitie", value: "some updated value", value_discount: "some updated value_discount", value_total_with_discount: "some updated value_total_with_discount", value_total_without_discount: "some updated value_total_without_discount"}
    @invalid_attrs %{cashier_number: nil, float: nil, id_product: nil, id_sale: nil, id_store: nil, integer: nil, profissional_1: nil, profissional_2: nil, quantitie: nil, value: nil, value_discount: nil, value_total_with_discount: nil, value_total_without_discount: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_item()

      item
    end

    test "list_itens/0 returns all itens" do
      item = item_fixture()
      assert Store.list_itens() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Store.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Store.create_item(@valid_attrs)
      assert item.cashier_number == "some cashier_number"
      assert item.float == "some float"
      assert item.id_product == "some id_product"
      assert item.id_sale == "some id_sale"
      assert item.id_store == "some id_store"
      assert item.integer == "some integer"
      assert item.profissional_1 == "some profissional_1"
      assert item.profissional_2 == "some profissional_2"
      assert item.quantitie == "some quantitie"
      assert item.value == "some value"
      assert item.value_discount == "some value_discount"
      assert item.value_total_with_discount == "some value_total_with_discount"
      assert item.value_total_without_discount == "some value_total_without_discount"
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Store.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.cashier_number == "some updated cashier_number"
      assert item.float == "some updated float"
      assert item.id_product == "some updated id_product"
      assert item.id_sale == "some updated id_sale"
      assert item.id_store == "some updated id_store"
      assert item.integer == "some updated integer"
      assert item.profissional_1 == "some updated profissional_1"
      assert item.profissional_2 == "some updated profissional_2"
      assert item.quantitie == "some updated quantitie"
      assert item.value == "some updated value"
      assert item.value_discount == "some updated value_discount"
      assert item.value_total_with_discount == "some updated value_total_with_discount"
      assert item.value_total_without_discount == "some updated value_total_without_discount"
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_item(item, @invalid_attrs)
      assert item == Store.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Store.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Store.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Store.change_item(item)
    end
  end

  describe "sales" do
    alias Mercafacil.Store.Sale

    @valid_attrs %{cashier_number: "some cashier_number", client_1: "some client_1", client_2: "some client_2", date: "some date", float: "some float", id_sale: "some id_sale", id_store: "some id_store", integer: "some integer", time: "some time", value_discount: "some value_discount", value_total_with_discount: "some value_total_with_discount", value_total_without_discount: "some value_total_without_discount"}
    @update_attrs %{cashier_number: "some updated cashier_number", client_1: "some updated client_1", client_2: "some updated client_2", date: "some updated date", float: "some updated float", id_sale: "some updated id_sale", id_store: "some updated id_store", integer: "some updated integer", time: "some updated time", value_discount: "some updated value_discount", value_total_with_discount: "some updated value_total_with_discount", value_total_without_discount: "some updated value_total_without_discount"}
    @invalid_attrs %{cashier_number: nil, client_1: nil, client_2: nil, date: nil, float: nil, id_sale: nil, id_store: nil, integer: nil, time: nil, value_discount: nil, value_total_with_discount: nil, value_total_without_discount: nil}

    def sale_fixture(attrs \\ %{}) do
      {:ok, sale} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_sale()

      sale
    end

    test "list_sales/0 returns all sales" do
      sale = sale_fixture()
      assert Store.list_sales() == [sale]
    end

    test "get_sale!/1 returns the sale with given id" do
      sale = sale_fixture()
      assert Store.get_sale!(sale.id) == sale
    end

    test "create_sale/1 with valid data creates a sale" do
      assert {:ok, %Sale{} = sale} = Store.create_sale(@valid_attrs)
      assert sale.cashier_number == "some cashier_number"
      assert sale.client_1 == "some client_1"
      assert sale.client_2 == "some client_2"
      assert sale.date == "some date"
      assert sale.float == "some float"
      assert sale.id_sale == "some id_sale"
      assert sale.id_store == "some id_store"
      assert sale.integer == "some integer"
      assert sale.time == "some time"
      assert sale.value_discount == "some value_discount"
      assert sale.value_total_with_discount == "some value_total_with_discount"
      assert sale.value_total_without_discount == "some value_total_without_discount"
    end

    test "create_sale/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_sale(@invalid_attrs)
    end

    test "update_sale/2 with valid data updates the sale" do
      sale = sale_fixture()
      assert {:ok, sale} = Store.update_sale(sale, @update_attrs)
      assert %Sale{} = sale
      assert sale.cashier_number == "some updated cashier_number"
      assert sale.client_1 == "some updated client_1"
      assert sale.client_2 == "some updated client_2"
      assert sale.date == "some updated date"
      assert sale.float == "some updated float"
      assert sale.id_sale == "some updated id_sale"
      assert sale.id_store == "some updated id_store"
      assert sale.integer == "some updated integer"
      assert sale.time == "some updated time"
      assert sale.value_discount == "some updated value_discount"
      assert sale.value_total_with_discount == "some updated value_total_with_discount"
      assert sale.value_total_without_discount == "some updated value_total_without_discount"
    end

    test "update_sale/2 with invalid data returns error changeset" do
      sale = sale_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_sale(sale, @invalid_attrs)
      assert sale == Store.get_sale!(sale.id)
    end

    test "delete_sale/1 deletes the sale" do
      sale = sale_fixture()
      assert {:ok, %Sale{}} = Store.delete_sale(sale)
      assert_raise Ecto.NoResultsError, fn -> Store.get_sale!(sale.id) end
    end

    test "change_sale/1 returns a sale changeset" do
      sale = sale_fixture()
      assert %Ecto.Changeset{} = Store.change_sale(sale)
    end
  end

  describe "itens" do
    alias Mercafacil.Store.Item

    @valid_attrs %{cashier_number: 42, id_product: 42, id_sale: 42, id_store: 42, profissional_1: 42, profissional_2: 42, quantitie: 120.5, value: 120.5, value_discount: 120.5, value_total_with_discount: 120.5, value_total_without_discount: 120.5}
    @update_attrs %{cashier_number: 43, id_product: 43, id_sale: 43, id_store: 43, profissional_1: 43, profissional_2: 43, quantitie: 456.7, value: 456.7, value_discount: 456.7, value_total_with_discount: 456.7, value_total_without_discount: 456.7}
    @invalid_attrs %{cashier_number: nil, id_product: nil, id_sale: nil, id_store: nil, profissional_1: nil, profissional_2: nil, quantitie: nil, value: nil, value_discount: nil, value_total_with_discount: nil, value_total_without_discount: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_item()

      item
    end

    test "list_itens/0 returns all itens" do
      item = item_fixture()
      assert Store.list_itens() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Store.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Store.create_item(@valid_attrs)
      assert item.cashier_number == 42
      assert item.id_product == 42
      assert item.id_sale == 42
      assert item.id_store == 42
      assert item.profissional_1 == 42
      assert item.profissional_2 == 42
      assert item.quantitie == 120.5
      assert item.value == 120.5
      assert item.value_discount == 120.5
      assert item.value_total_with_discount == 120.5
      assert item.value_total_without_discount == 120.5
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Store.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.cashier_number == 43
      assert item.id_product == 43
      assert item.id_sale == 43
      assert item.id_store == 43
      assert item.profissional_1 == 43
      assert item.profissional_2 == 43
      assert item.quantitie == 456.7
      assert item.value == 456.7
      assert item.value_discount == 456.7
      assert item.value_total_with_discount == 456.7
      assert item.value_total_without_discount == 456.7
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_item(item, @invalid_attrs)
      assert item == Store.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Store.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Store.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Store.change_item(item)
    end
  end

  describe "sales" do
    alias Mercafacil.Store.Sale

    @valid_attrs %{cashier_number: 42, client_1: 42, client_2: 42, date: ~D[2010-04-17], id_sale: 42, id_store: 42, time: ~T[14:00:00.000000], value_discount: 120.5, value_total_with_discount: 120.5, value_total_without_discount: 120.5}
    @update_attrs %{cashier_number: 43, client_1: 43, client_2: 43, date: ~D[2011-05-18], id_sale: 43, id_store: 43, time: ~T[15:01:01.000000], value_discount: 456.7, value_total_with_discount: 456.7, value_total_without_discount: 456.7}
    @invalid_attrs %{cashier_number: nil, client_1: nil, client_2: nil, date: nil, id_sale: nil, id_store: nil, time: nil, value_discount: nil, value_total_with_discount: nil, value_total_without_discount: nil}

    def sale_fixture(attrs \\ %{}) do
      {:ok, sale} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_sale()

      sale
    end

    test "list_sales/0 returns all sales" do
      sale = sale_fixture()
      assert Store.list_sales() == [sale]
    end

    test "get_sale!/1 returns the sale with given id" do
      sale = sale_fixture()
      assert Store.get_sale!(sale.id) == sale
    end

    test "create_sale/1 with valid data creates a sale" do
      assert {:ok, %Sale{} = sale} = Store.create_sale(@valid_attrs)
      assert sale.cashier_number == 42
      assert sale.client_1 == 42
      assert sale.client_2 == 42
      assert sale.date == ~D[2010-04-17]
      assert sale.id_sale == 42
      assert sale.id_store == 42
      assert sale.time == ~T[14:00:00.000000]
      assert sale.value_discount == 120.5
      assert sale.value_total_with_discount == 120.5
      assert sale.value_total_without_discount == 120.5
    end

    test "create_sale/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_sale(@invalid_attrs)
    end

    test "update_sale/2 with valid data updates the sale" do
      sale = sale_fixture()
      assert {:ok, sale} = Store.update_sale(sale, @update_attrs)
      assert %Sale{} = sale
      assert sale.cashier_number == 43
      assert sale.client_1 == 43
      assert sale.client_2 == 43
      assert sale.date == ~D[2011-05-18]
      assert sale.id_sale == 43
      assert sale.id_store == 43
      assert sale.time == ~T[15:01:01.000000]
      assert sale.value_discount == 456.7
      assert sale.value_total_with_discount == 456.7
      assert sale.value_total_without_discount == 456.7
    end

    test "update_sale/2 with invalid data returns error changeset" do
      sale = sale_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_sale(sale, @invalid_attrs)
      assert sale == Store.get_sale!(sale.id)
    end

    test "delete_sale/1 deletes the sale" do
      sale = sale_fixture()
      assert {:ok, %Sale{}} = Store.delete_sale(sale)
      assert_raise Ecto.NoResultsError, fn -> Store.get_sale!(sale.id) end
    end

    test "change_sale/1 returns a sale changeset" do
      sale = sale_fixture()
      assert %Ecto.Changeset{} = Store.change_sale(sale)
    end
  end
end
