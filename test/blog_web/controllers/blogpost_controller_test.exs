defmodule BlogWeb.BlogpostControllerTest do
  use BlogWeb.ConnCase

  alias Blog.SiteContent
  alias Blog.SiteContent.Blogpost

  @create_attrs %{description: "some description", published: true, slug: "some slug", text: "some text", title: "some title"}
  @update_attrs %{description: "some updated description", published: false, slug: "some updated slug", text: "some updated text", title: "some updated title"}
  @invalid_attrs %{description: nil, published: nil, slug: nil, text: nil, title: nil}

  def fixture(:blogpost) do
    {:ok, blogpost} = SiteContent.create_blogpost(@create_attrs)
    blogpost
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all blogposts", %{conn: conn} do
      conn = get conn, blogpost_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create blogpost" do
    test "renders blogpost when data is valid", %{conn: conn} do
      conn = post conn, blogpost_path(conn, :create), blogpost: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, blogpost_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some description",
        "published" => true,
        "slug" => "some slug",
        "text" => "some text",
        "title" => "some title"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, blogpost_path(conn, :create), blogpost: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update blogpost" do
    setup [:create_blogpost]

    test "renders blogpost when data is valid", %{conn: conn, blogpost: %Blogpost{id: id} = blogpost} do
      conn = put conn, blogpost_path(conn, :update, blogpost), blogpost: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, blogpost_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "description" => "some updated description",
        "published" => false,
        "slug" => "some updated slug",
        "text" => "some updated text",
        "title" => "some updated title"}
    end

    test "renders errors when data is invalid", %{conn: conn, blogpost: blogpost} do
      conn = put conn, blogpost_path(conn, :update, blogpost), blogpost: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete blogpost" do
    setup [:create_blogpost]

    test "deletes chosen blogpost", %{conn: conn, blogpost: blogpost} do
      conn = delete conn, blogpost_path(conn, :delete, blogpost)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, blogpost_path(conn, :show, blogpost)
      end
    end
  end

  defp create_blogpost(_) do
    blogpost = fixture(:blogpost)
    {:ok, blogpost: blogpost}
  end
end
