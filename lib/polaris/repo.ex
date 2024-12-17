defmodule Polaris.Repo do
  use Ecto.Repo,
    otp_app: :polaris,
    adapter: Ecto.Adapters.Postgres
end
