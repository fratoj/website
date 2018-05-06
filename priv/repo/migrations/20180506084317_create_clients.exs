defmodule Blog.Repo.Migrations.CreateClients do
  use Ecto.Migration

  def change do
    create table(:clients) do
      add(:name, :string)
      add(:bio, :string)
      add(:url, :string)
      add(:active, :boolean)

      timestamps()
    end
  end
end
