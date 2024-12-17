defmodule Polaris.Inventory.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :size, :string
    field :type, :string
    field :color, :string
    field :brand, :string
    field :price, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [:type, :brand, :color, :size, :price])
    |> validate_required([:type, :brand, :color, :size, :price])
  end
end
