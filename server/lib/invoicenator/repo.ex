defmodule Invoicenator.Repo do
  use Ecto.Repo,
    otp_app: :invoicenator,
    adapter: Ecto.Adapters.Postgres
end
