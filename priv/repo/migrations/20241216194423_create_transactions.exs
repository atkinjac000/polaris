defmodule Polaris.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :"customer-name", :string
      add :"customer-email", :string
      add :amount, :float

      timestamps(type: :utc_datetime)
    end
  end
end
