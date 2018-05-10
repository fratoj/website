defmodule BlogWeb.BlogpostController do
  use BlogWeb, :controller

  alias Blog.SiteContent
  alias Blog.SiteContent.Blogpost

  action_fallback BlogWeb.FallbackController

  def index(conn, _params) do
    blogposts = SiteContent.list_blogposts()
    render(conn, "index.json", blogposts: blogposts)
  end

  def create(conn, %{"blogpost" => blogpost_params}) do
    with {:ok, %Blogpost{} = blogpost} <- SiteContent.create_blogpost(blogpost_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", blogpost_path(conn, :show, blogpost))
      |> render("show.json", blogpost: blogpost)
    end
  end

  def show(conn, %{"id" => id}) do
    blogpost = SiteContent.get_blogpost!(id)
    render(conn, "show.json", blogpost: blogpost)
  end

  def update(conn, %{"id" => id, "blogpost" => blogpost_params}) do
    blogpost = SiteContent.get_blogpost!(id)

    with {:ok, %Blogpost{} = blogpost} <- SiteContent.update_blogpost(blogpost, blogpost_params) do
      render(conn, "show.json", blogpost: blogpost)
    end
  end

  def delete(conn, %{"id" => id}) do
    blogpost = SiteContent.get_blogpost!(id)
    with {:ok, %Blogpost{}} <- SiteContent.delete_blogpost(blogpost) do
      send_resp(conn, :no_content, "")
    end
  end
end
