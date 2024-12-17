defmodule PolarisWeb.TransactionController do
  use PolarisWeb, :controller

  alias Polaris.Sales
  alias Polaris.Sales.Transaction

  def index(conn, _params) do
    transactions = Sales.list_transactions()
    render(conn, :index, transactions: transactions)
  end

  def new(conn, _params) do
    changeset = Sales.change_transaction(%Transaction{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"transaction" => transaction_params}) do
    case Sales.create_transaction(transaction_params) do
      {:ok, transaction} ->
        conn
        |> put_flash(:info, "Transaction created successfully.")
        |> redirect(to: ~p"/transactions/#{transaction}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    transaction = Sales.get_transaction!(id)
    render(conn, :show, transaction: transaction)
  end

  def edit(conn, %{"id" => id}) do
    transaction = Sales.get_transaction!(id)
    changeset = Sales.change_transaction(transaction)
    render(conn, :edit, transaction: transaction, changeset: changeset)
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    transaction = Sales.get_transaction!(id)

    case Sales.update_transaction(transaction, transaction_params) do
      {:ok, transaction} ->
        conn
        |> put_flash(:info, "Transaction updated successfully.")
        |> redirect(to: ~p"/transactions/#{transaction}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, transaction: transaction, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Sales.get_transaction!(id)
    {:ok, _transaction} = Sales.delete_transaction(transaction)

    conn
    |> put_flash(:info, "Transaction deleted successfully.")
    |> redirect(to: ~p"/transactions")
  end
end
