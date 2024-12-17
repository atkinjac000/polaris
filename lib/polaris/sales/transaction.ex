defmodule Polaris.Sales.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transactions" do
    field :"customer_name", :string
    field :"customer_email", :string
    field :amount, :float

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:"customer_name", :"customer_email", :amount])
    |> validate_required([:"customer_name", :"customer_email", :amount])
  end
end
