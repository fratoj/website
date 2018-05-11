{:ok, _} = Application.ensure_all_started(:ex_machina)

ExUnit.configure(exclude: [pending: true])
ExUnit.start()

Ecto.Adapters.SQL.Sandbox.mode(Blog.Repo, :manual)
# Ecto.Adapters.SQL.Sandbox.mode(Blog.Repo, {:shared, self()})

# Blog.Seeds.call()
