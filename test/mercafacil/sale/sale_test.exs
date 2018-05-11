defmodule Mercafacil.SaleTest do
  use Mercafacil.DataCase

  alias Mercafacil.Sale

  describe "itens" do
    alias Mercafacil.Sale.Item

    @valid_attrs %{value: 42, value_discount: 42, value_total_with_discount: 42, value_total_without_discount: 42}
    @update_attrs %{value: 43, value_discount: 43, value_total_with_discount: 43, value_total_without_discount: 43}
    @invalid_attrs %{value: nil, value_discount: nil, value_total_with_discount: nil, value_total_without_discount: nil}

    def item_fixture(attrs \\ %{}) do
      {:ok, item} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Sale.create_item()

      item
    end

    test "list_itens/0 returns all itens" do
      item = item_fixture()
      assert Sale.list_itens() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Sale.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      assert {:ok, %Item{} = item} = Sale.create_item(@valid_attrs)
      assert item.value == 42
      assert item.value_discount == 42
      assert item.value_total_with_discount == 42
      assert item.value_total_without_discount == 42
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sale.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      assert {:ok, item} = Sale.update_item(item, @update_attrs)
      assert %Item{} = item
      assert item.value == 43
      assert item.value_discount == 43
      assert item.value_total_with_discount == 43
      assert item.value_total_without_discount == 43
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Sale.update_item(item, @invalid_attrs)
      assert item == Sale.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Sale.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Sale.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Sale.change_item(item)
    end
  end
end
