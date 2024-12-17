defmodule PolarisWeb.TransactionControllerTest do
  use PolarisWeb.ConnCase

  import Polaris.SalesFixtures

  @create_attrs %{"customer_name": "some customer-name", "customer_email": "some customer-email", amount: 120.5}
  @update_attrs %{"customer_name": "some updated customer-name", "customer_email": "some updated customer-email", amount: 456.7}
  @invalid_attrs %{"customer_name": nil, "customer_email": nil, amount: nil}

  describe "index" do
    test "lists all transactions", %{conn: conn} do
      conn = get(conn, ~p"/transactions")
      assert html_response(conn, 200) =~ "Listing Transactions"
    end
  end

  describe "new transaction" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/transactions/new")
      assert html_response(conn, 200) =~ "New Transaction"
    end
  end

  describe "create transaction" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/transactions", transaction: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/transactions/#{id}"

      conn = get(conn, ~p"/transactions/#{id}")
      assert html_response(conn, 200) =~ "Transaction #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/transactions", transaction: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Transaction"
    end
  end

  describe "edit transaction" do
    setup [:create_transaction]

    test "renders form for editing chosen transaction", %{conn: conn, transaction: transaction} do
      conn = get(conn, ~p"/transactions/#{transaction}/edit")
      assert html_response(conn, 200) =~ "Edit Transaction"
    end
  end

  describe "update transaction" do
    setup [:create_transaction]

    test "redirects when data is valid", %{conn: conn, transaction: transaction} do
      conn = put(conn, ~p"/transactions/#{transaction}", transaction: @update_attrs)
      assert redirected_to(conn) == ~p"/transactions/#{transaction}"

      conn = get(conn, ~p"/transactions/#{transaction}")
      assert html_response(conn, 200) =~ "some updated customer-name"
    end

    test "renders errors when data is invalid", %{conn: conn, transaction: transaction} do
      conn = put(conn, ~p"/transactions/#{transaction}", transaction: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Transaction"
    end
  end

  describe "delete transaction" do
    setup [:create_transaction]

    test "deletes chosen transaction", %{conn: conn, transaction: transaction} do
      conn = delete(conn, ~p"/transactions/#{transaction}")
      assert redirected_to(conn) == ~p"/transactions"

      assert_error_sent 404, fn ->
        get(conn, ~p"/transactions/#{transaction}")
      end
    end
  end

  defp create_transaction(_) do
    transaction = transaction_fixture()
    %{transaction: transaction}
  end
end
