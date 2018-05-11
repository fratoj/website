defmodule Blog.SiteContent.Blogpost do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.User

  schema "blogposts" do
    field(:description, :string)
    field(:published, :boolean, default: false)
    field(:slug, :string)
    field(:text, :string)
    field(:title, :string)
    belongs_to(:user, User)

    timestamps()
  end

  @doc false
  def changeset(blogpost, attrs) do
    blogpost
    |> cast(attrs, [:title, :description, :text, :slug, :published, :user_id])
    |> foreign_key_constraint(:user_id)
    |> validate_required([:title, :description, :text, :slug, :published])
  end
end
