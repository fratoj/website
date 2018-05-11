defmodule BlogWeb.CareerControllerTest do
  use BlogWeb.ConnCase

  alias Blog.SiteContent
  alias Blog.SiteContent.Career

  @create_attrs %{active: true, text: "some text", title: "some title", url: "some url"}
  @update_attrs %{active: false, text: "some updated text", title: "some updated title", url: "some updated url"}
  @invalid_attrs %{active: nil, text: nil, title: nil, url: nil}

  def fixture(:career) do
    {:ok, career} = SiteContent.create_career(@create_attrs)
    career
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all careers", %{conn: conn} do
      conn = get conn, career_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create career" do
    test "renders career when data is valid", %{conn: conn} do
      conn = post conn, career_path(conn, :create), career: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, career_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "active" => true,
        "text" => "some text",
        "title" => "some title",
        "url" => "some url"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, career_path(conn, :create), career: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update career" do
    setup [:create_career]

    test "renders career when data is valid", %{conn: conn, career: %Career{id: id} = career} do
      conn = put conn, career_path(conn, :update, career), career: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, career_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "active" => false,
        "text" => "some updated text",
        "title" => "some updated title",
        "url" => "some updated url"}
    end

    test "renders errors when data is invalid", %{conn: conn, career: career} do
      conn = put conn, career_path(conn, :update, career), career: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete career" do
    setup [:create_career]

    test "deletes chosen career", %{conn: conn, career: career} do
      conn = delete conn, career_path(conn, :delete, career)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, career_path(conn, :show, career)
      end
    end
  end

  defp create_career(_) do
    career = fixture(:career)
    {:ok, career: career}
  end
end
