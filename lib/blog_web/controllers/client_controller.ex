defmodule BlogWeb.ClientController do
  use BlogWeb, :controller

  alias Blog.SiteContent
  alias Blog.SiteContent.Client

  action_fallback BlogWeb.FallbackController

  def index(conn, _params) do
    clients = SiteContent.list_clients()
    render(conn, "index.json", clients: clients)
  end

  def create(conn, %{"client" => client_params}) do
    with {:ok, %Client{} = client} <- SiteContent.create_client(client_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", client_path(conn, :show, client))
      |> render("show.json", client: client)
    end
  end

  def show(conn, %{"id" => id}) do
    client = SiteContent.get_client!(id)
    render(conn, "show.json", client: client)
  end

  def update(conn, %{"id" => id, "client" => client_params}) do
    client = SiteContent.get_client!(id)

    with {:ok, %Client{} = client} <- SiteContent.update_client(client, client_params) do
      render(conn, "show.json", client: client)
    end
  end

  def delete(conn, %{"id" => id}) do
    client = SiteContent.get_client!(id)
    with {:ok, %Client{}} <- SiteContent.delete_client(client) do
      send_resp(conn, :no_content, "")
    end
  end
end
