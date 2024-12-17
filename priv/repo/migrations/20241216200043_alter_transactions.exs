defmodule Polaris.Repo.Migrations.AlterTransactions do
  use Ecto.Migration

  def change do
    rename table(:transactions), :"customer-name", to: :customer_name
    rename table(:transactions), :"customer-email", to: :customer_email
  end
end
