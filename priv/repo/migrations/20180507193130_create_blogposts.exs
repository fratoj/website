defmodule Blog.Repo.Migrations.CreateBlogposts do
  use Ecto.Migration

  def change do
    create table(:blogposts) do
      add(:title, :string)
      add(:description, :string)
      add(:text, :text)
      add(:slug, :text)
      add(:published, :boolean, default: false, null: false)
      add(:user_id, references(:users, on_delete: :nothing), null: false)

      timestamps()
    end

    create(index(:blogposts, [:user_id]))
  end
end
