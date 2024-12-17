defmodule Polaris.SalesTest do
  use Polaris.DataCase

  alias Polaris.Sales

  describe "transactions" do
    alias Polaris.Sales.Transaction

    import Polaris.SalesFixtures

    @invalid_attrs %{"customer_name": nil, "customer_email": nil, amount: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert Sales.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Sales.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{"customer_name": "some customer-name", "customer_email": "some customer-email", amount: 120.5}

      assert {:ok, %Transaction{} = transaction} = Sales.create_transaction(valid_attrs)
      assert transaction.customer_name == "some customer-name"
      assert transaction.customer_email == "some customer-email"
      assert transaction.amount == 120.5
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Sales.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      update_attrs = %{"customer_name": "some updated customer-name", "customer_email": "some updated customer-email", amount: 456.7}

      assert {:ok, %Transaction{} = transaction} = Sales.update_transaction(transaction, update_attrs)
      assert transaction.customer_name == "some updated customer-name"
      assert transaction.customer_email == "some updated customer-email"
      assert transaction.amount == 456.7
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Sales.update_transaction(transaction, @invalid_attrs)
      assert transaction == Sales.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Sales.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Sales.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Sales.change_transaction(transaction)
    end
  end
end
