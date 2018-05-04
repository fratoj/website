defmodule Blog.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add(:is_active, :boolean, default: false, null: false)
    end

    create(unique_index(:users, [:email]))
  end
end
