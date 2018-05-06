defmodule Blog.SiteContent.Client do
  use Ecto.Schema
  import Ecto.Changeset


  schema "clients" do
    field :description, :string
    field :name, :string
    field :url, :string

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name, :description, :url])
    |> validate_required([:name, :description, :url])
  end
end
