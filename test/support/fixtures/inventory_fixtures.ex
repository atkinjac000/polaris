defmodule Polaris.InventoryFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Polaris.Inventory` context.
  """

  @doc """
  Generate a item.
  """
  def item_fixture(attrs \\ %{}) do
    {:ok, item} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        color: "some color",
        price: 120.5,
        size: "some size",
        type: "some type"
      })
      |> Polaris.Inventory.create_item()

    item
  end
end
