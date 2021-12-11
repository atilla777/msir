defmodule Msir.Repo do
  use Ecto.Repo,
    otp_app: :msir,
    adapter: Ecto.Adapters.Postgres
end
