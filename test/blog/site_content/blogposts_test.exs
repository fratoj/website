defmodule Blog.BlogpostsTest do
  use Blog.DataCase

  alias Blog.SiteContent
  alias Blog.User

  setup do
    Repo.insert!(%User{
      id: 1,
      email: "jos@topper.com",
      is_active: true,
      first_name: "Jos",
      last_name: "Topper",
      provider: "google",
      token: "ya29.GluwBUYLWn22FDxVPhYKpOaq"
    })

    :ok
  end

  describe "blogposts" do
    alias Blog.SiteContent.Blogpost

    @valid_attrs %{
      description: "some description",
      published: true,
      slug: "some slug",
      text: "some text",
      title: "some title",
      user_id: 1
    }
    @update_attrs %{
      description: "some updated description",
      published: false,
      slug: "some updated slug",
      text: "some updated text",
      title: "some updated title",
      user_id: 1
    }
    @invalid_attrs %{
      description: nil,
      published: nil,
      slug: nil,
      text: nil,
      title: nil,
      user_id: 1
    }

    def blogpost_fixture(attrs \\ %{}) do
      {:ok, blogpost} =
        attrs
        |> Enum.into(@valid_attrs)
        |> SiteContent.create_blogpost()

      blogpost
    end

    test "list_blogposts/0 returns all blogposts" do
      blogpost = blogpost_fixture()
      lalaposts = SiteContent.list_blogposts()
      lalapost = Enum.at(lalaposts, 0)
      assert lalapost.description == blogpost.description
    end

    test "get_blogpost!/1 returns the blogpost with given id" do
      blogpost = blogpost_fixture()
      lalapost = SiteContent.get_blogpost!(blogpost.id)
      assert lalapost.description == blogpost.description
    end

    test "create_blogpost/1 with valid data creates a blogpost" do
      assert {:ok, %Blogpost{} = blogpost} = SiteContent.create_blogpost(@valid_attrs)

      assert blogpost.description == "some description"
      assert blogpost.published == true
      assert blogpost.slug == "some slug"
      assert blogpost.text == "some text"
      assert blogpost.title == "some title"
    end

    test "create_blogpost/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = SiteContent.create_blogpost(@invalid_attrs)
    end

    test "update_blogpost/2 with valid data updates the blogpost" do
      blogpost = blogpost_fixture()
      assert {:ok, blogpost} = SiteContent.update_blogpost(blogpost, @update_attrs)
      assert %Blogpost{} = blogpost
      assert blogpost.description == "some updated description"
      assert blogpost.published == false
      assert blogpost.slug == "some updated slug"
      assert blogpost.text == "some updated text"
      assert blogpost.title == "some updated title"
    end

    test "update_blogpost/2 with invalid data returns error changeset" do
      blogpost = blogpost_fixture()
      assert {:error, %Ecto.Changeset{}} = SiteContent.update_blogpost(blogpost, @invalid_attrs)
      lalapost = SiteContent.get_blogpost!(blogpost.id)
      assert lalapost.description == blogpost.description
    end

    test "delete_blogpost/1 deletes the blogpost" do
      blogpost = blogpost_fixture()
      assert {:ok, %Blogpost{}} = SiteContent.delete_blogpost(blogpost)
      assert_raise Ecto.NoResultsError, fn -> SiteContent.get_blogpost!(blogpost.id) end
    end

    test "change_blogpost/1 returns a blogpost changeset" do
      blogpost = blogpost_fixture()
      assert %Ecto.Changeset{} = SiteContent.change_blogpost(blogpost)
    end
  end
end
