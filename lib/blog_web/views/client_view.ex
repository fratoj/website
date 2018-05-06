defmodule BlogWeb.ClientView do
  use BlogWeb, :view
  alias BlogWeb.ClientView

  def render("index.json", %{clients: clients}) do
    %{data: render_many(clients, ClientView, "client.json")}
  end

  def render("show.json", %{client: client}) do
    %{data: render_one(client, ClientView, "client.json")}
  end

  def render("client.json", %{client: client}) do
    %{id: client.id,
      name: client.name,
      description: client.description,
      url: client.url}
  end
end
