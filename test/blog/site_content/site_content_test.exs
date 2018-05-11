defmodule Blog.SiteContentTest do
  use Blog.DataCase

  alias Blog.SiteContent

  describe "clients" do
    alias Blog.SiteContent.Client

    @valid_attrs %{bio: "some bio", name: "some name", url: "some url", active: true}
    @update_attrs %{
      bio: "some updated bio",
      name: "some updated name",
      url: "some updated url",
      active: true
    }
    @invalid_attrs %{bio: nil, name: nil, url: nil, active: true}

    def client_fixture(attrs \\ %{}) do
      {:ok, client} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteContent.create_client()

      client
    end

    test "list_clients/0 returns all clients" do
      client = client_fixture()
      assert SiteContent.list_clients() == [client]
    end

    test "get_client!/1 returns the client with given id" do
      client = client_fixture()
      assert SiteContent.get_client!(client.id) == client
    end

    test "create_client/1 with valid data creates a client" do
      assert {:ok, %Client{} = client} = SiteContent.create_client(@valid_attrs)
      assert client.bio == "some bio"
      assert client.name == "some name"
      assert client.url == "some url"
      assert client.active == true
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteContent.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = SiteContent.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.bio == "some updated bio"
      assert client.name == "some updated name"
      assert client.url == "some updated url"
      assert client.active == true
    end

    test "update_client/2 with invalid data returns error changeset" do
      client = client_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteContent.update_client(client, @invalid_attrs)
      assert client == SiteContent.get_client!(client.id)
    end

    test "delete_client/1 deletes the client" do
      client = client_fixture()
      assert {:ok, %Client{}} = SiteContent.delete_client(client)
      assert_raise Ecto.NoResultsError, fn -> SiteContent.get_client!(client.id) end
    end

    test "change_client/1 returns a client changeset" do
      client = client_fixture()
      assert %Ecto.Changeset{} = SiteContent.change_client(client)
    end
  end

  describe "careers" do
    alias Blog.SiteContent.Career

    @valid_attrs %{active: true, text: "some text", title: "some title", url: "some url"}
    @update_attrs %{
      active: false,
      text: "some updated text",
      title: "some updated title",
      url: "some updated url"
    }
    @invalid_attrs %{active: nil, text: nil, title: nil, url: nil}

    def career_fixture(attrs \\ %{}) do
      {:ok, career} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteContent.create_career()

      career
    end

    test "list_careers/0 returns all careers" do
      career = career_fixture()
      assert SiteContent.list_careers() == [career]
    end

    test "get_career!/1 returns the career with given id" do
      career = career_fixture()
      assert SiteContent.get_career!(career.id) == career
    end

    test "create_career/1 with valid data creates a career" do
      assert {:ok, %Career{} = career} = SiteContent.create_career(@valid_attrs)
      assert career.active == true
      assert career.text == "some text"
      assert career.title == "some title"
      assert career.url == "some url"
    end

    test "create_career/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteContent.create_career(@invalid_attrs)
    end

    test "update_career/2 with valid data updates the career" do
      career = career_fixture()
      assert {:ok, career} = SiteContent.update_career(career, @update_attrs)
      assert %Career{} = career
      assert career.active == false
      assert career.text == "some updated text"
      assert career.title == "some updated title"
      assert career.url == "some updated url"
    end

    test "update_career/2 with invalid data returns error changeset" do
      career = career_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteContent.update_career(career, @invalid_attrs)
      assert career == SiteContent.get_career!(career.id)
    end

    test "delete_career/1 deletes the career" do
      career = career_fixture()
      assert {:ok, %Career{}} = SiteContent.delete_career(career)
      assert_raise Ecto.NoResultsError, fn -> SiteContent.get_career!(career.id) end
    end

    test "change_career/1 returns a career changeset" do
      career = career_fixture()
      assert %Ecto.Changeset{} = SiteContent.change_career(career)
    end
  end
end
