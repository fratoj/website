defmodule Blog.SiteContentTest do
  use Blog.DataCase

  alias Blog.SiteContent

  describe "clients" do
    alias Blog.SiteContent.Client

    @valid_attrs %{description: "some description", name: "some name", url: "some url"}
    @update_attrs %{description: "some updated description", name: "some updated name", url: "some updated url"}
    @invalid_attrs %{description: nil, name: nil, url: nil}

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
      assert client.description == "some description"
      assert client.name == "some name"
      assert client.url == "some url"
    end

    test "create_client/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteContent.create_client(@invalid_attrs)
    end

    test "update_client/2 with valid data updates the client" do
      client = client_fixture()
      assert {:ok, client} = SiteContent.update_client(client, @update_attrs)
      assert %Client{} = client
      assert client.description == "some updated description"
      assert client.name == "some updated name"
      assert client.url == "some updated url"
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
end
