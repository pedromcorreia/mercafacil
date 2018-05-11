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

  describe "sale_itens" do
    alias Mercafacil.Store.Sale_Intem

    @valid_attrs %{quantities: 42}
    @update_attrs %{quantities: 43}
    @invalid_attrs %{quantities: nil}

    def sale__intem_fixture(attrs \\ %{}) do
      {:ok, sale__intem} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Store.create_sale__intem()

      sale__intem
    end

    test "list_sale_itens/0 returns all sale_itens" do
      sale__intem = sale__intem_fixture()
      assert Store.list_sale_itens() == [sale__intem]
    end

    test "get_sale__intem!/1 returns the sale__intem with given id" do
      sale__intem = sale__intem_fixture()
      assert Store.get_sale__intem!(sale__intem.id) == sale__intem
    end

    test "create_sale__intem/1 with valid data creates a sale__intem" do
      assert {:ok, %Sale_Intem{} = sale__intem} = Store.create_sale__intem(@valid_attrs)
      assert sale__intem.quantities == 42
    end

    test "create_sale__intem/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Store.create_sale__intem(@invalid_attrs)
    end

    test "update_sale__intem/2 with valid data updates the sale__intem" do
      sale__intem = sale__intem_fixture()
      assert {:ok, sale__intem} = Store.update_sale__intem(sale__intem, @update_attrs)
      assert %Sale_Intem{} = sale__intem
      assert sale__intem.quantities == 43
    end

    test "update_sale__intem/2 with invalid data returns error changeset" do
      sale__intem = sale__intem_fixture()
      assert {:error, %Ecto.Changeset{}} = Store.update_sale__intem(sale__intem, @invalid_attrs)
      assert sale__intem == Store.get_sale__intem!(sale__intem.id)
    end

    test "delete_sale__intem/1 deletes the sale__intem" do
      sale__intem = sale__intem_fixture()
      assert {:ok, %Sale_Intem{}} = Store.delete_sale__intem(sale__intem)
      assert_raise Ecto.NoResultsError, fn -> Store.get_sale__intem!(sale__intem.id) end
    end

    test "change_sale__intem/1 returns a sale__intem changeset" do
      sale__intem = sale__intem_fixture()
      assert %Ecto.Changeset{} = Store.change_sale__intem(sale__intem)
    end
  end
end
