defmodule Polaris.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :type, :string
      add :brand, :string
      add :color, :string
      add :size, :string
      add :price, :float

      timestamps(type: :utc_datetime)
    end
  end
end
