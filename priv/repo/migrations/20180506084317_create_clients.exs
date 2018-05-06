defmodule Blog.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add :name, :string
      add :description, :string
      add :url, :string

      timestamps()
    end

  end
end
