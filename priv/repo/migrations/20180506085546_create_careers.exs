defmodule Blog.Repo.Migrations.CreateCareers do
  use Ecto.Migration

  def change do
    create table(:careers) do
      add(:title, :string)
      add(:text, :text)
      add(:url, :string)
      add(:active, :boolean, default: false, null: false)

      timestamps()
    end
  end
end
