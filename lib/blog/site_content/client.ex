defmodule Blog.SiteContent.Client do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clients" do
    field(:bio, :string)
    field(:name, :string)
    field(:url, :string)
    field(:active, :boolean)

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :bio, :url, :active])
    |> validate_required([:name, :bio, :url, :active])
  end
end
