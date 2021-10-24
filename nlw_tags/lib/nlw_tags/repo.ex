defmodule NlwTags.Repo do
  use Ecto.Repo,
    otp_app: :nlw_tags,
    adapter: Ecto.Adapters.Postgres
end
