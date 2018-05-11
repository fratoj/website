defmodule Blog.SiteContent.Career do
  use Ecto.Schema
  import Ecto.Changeset

  schema "careers" do
    field(:active, :boolean, default: false)
    field(:text, :string)
    field(:title, :string)
    field(:url, :string)

    timestamps()
  end

  @doc false
  def changeset(career, attrs) do
    career
    |> cast(attrs, [:title, :text, :url, :active])
    |> validate_required([:title, :text, :url, :active])
  end
end
