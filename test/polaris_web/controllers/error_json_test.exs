defmodule PolarisWeb.ErrorJSONTest do
  use PolarisWeb.ConnCase, async: true

  test "renders 404" do
    assert PolarisWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert PolarisWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
