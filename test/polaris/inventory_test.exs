defmodule Polaris.InventoryTest do
  use Polaris.DataCase

  alias Polaris.Inventory

  describe "items" do
    alias Polaris.Inventory.Item

    import Polaris.InventoryFixtures

    @invalid_attrs %{size: nil, type: nil, color: nil, brand: nil, price: nil}

    test "list_items/0 returns all items" do
      item = item_fixture()
      assert Inventory.list_items() == [item]
    end

    test "get_item!/1 returns the item with given id" do
      item = item_fixture()
      assert Inventory.get_item!(item.id) == item
    end

    test "create_item/1 with valid data creates a item" do
      valid_attrs = %{size: "some size", type: "some type", color: "some color", brand: "some brand", price: 120.5}

      assert {:ok, %Item{} = item} = Inventory.create_item(valid_attrs)
      assert item.size == "some size"
      assert item.type == "some type"
      assert item.color == "some color"
      assert item.brand == "some brand"
      assert item.price == 120.5
    end

    test "create_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Inventory.create_item(@invalid_attrs)
    end

    test "update_item/2 with valid data updates the item" do
      item = item_fixture()
      update_attrs = %{size: "some updated size", type: "some updated type", color: "some updated color", brand: "some updated brand", price: 456.7}

      assert {:ok, %Item{} = item} = Inventory.update_item(item, update_attrs)
      assert item.size == "some updated size"
      assert item.type == "some updated type"
      assert item.color == "some updated color"
      assert item.brand == "some updated brand"
      assert item.price == 456.7
    end

    test "update_item/2 with invalid data returns error changeset" do
      item = item_fixture()
      assert {:error, %Ecto.Changeset{}} = Inventory.update_item(item, @invalid_attrs)
      assert item == Inventory.get_item!(item.id)
    end

    test "delete_item/1 deletes the item" do
      item = item_fixture()
      assert {:ok, %Item{}} = Inventory.delete_item(item)
      assert_raise Ecto.NoResultsError, fn -> Inventory.get_item!(item.id) end
    end

    test "change_item/1 returns a item changeset" do
      item = item_fixture()
      assert %Ecto.Changeset{} = Inventory.change_item(item)
    end
  end
end
