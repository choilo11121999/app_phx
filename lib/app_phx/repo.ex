defmodule AppPhx.Repo do
  use Ecto.Repo,
    otp_app: :app_phx,
    adapter: Ecto.Adapters.Postgres
end
