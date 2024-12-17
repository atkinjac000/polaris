defmodule Polaris.SalesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Polaris.Sales` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        amount: 120.5,
        customer_email: "some customer-email",
        customer_name: "some customer-name"
      })
      |> Polaris.Sales.create_transaction()

    transaction
  end
end
