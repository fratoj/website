defmodule BlogWeb.CareerController do
  use BlogWeb, :controller

  alias Blog.SiteContent
  alias Blog.SiteContent.Career

  action_fallback BlogWeb.FallbackController

  def index(conn, _params) do
    careers = SiteContent.list_careers()
    render(conn, "index.json", careers: careers)
  end

  def create(conn, %{"career" => career_params}) do
    with {:ok, %Career{} = career} <- SiteContent.create_career(career_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", career_path(conn, :show, career))
      |> render("show.json", career: career)
    end
  end

  def show(conn, %{"id" => id}) do
    career = SiteContent.get_career!(id)
    render(conn, "show.json", career: career)
  end

  def update(conn, %{"id" => id, "career" => career_params}) do
    career = SiteContent.get_career!(id)

    with {:ok, %Career{} = career} <- SiteContent.update_career(career, career_params) do
      render(conn, "show.json", career: career)
    end
  end

  def delete(conn, %{"id" => id}) do
    career = SiteContent.get_career!(id)
    with {:ok, %Career{}} <- SiteContent.delete_career(career) do
      send_resp(conn, :no_content, "")
    end
  end
end
