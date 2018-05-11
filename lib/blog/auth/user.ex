defmodule Blog.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Blog.SiteContent.Blogpost

  schema "users" do
    field(:email, :string)
    field(:first_name, :string)
    field(:last_name, :string)
    field(:provider, :string)
    field(:token, :string)
    field(:is_active, :boolean)
    has_many(:blogposts, Blogpost)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:first_name, :last_name, :email, :provider, :token, :is_active])
    |> validate_required([:first_name, :last_name, :email])
  end
end
