defmodule BlogWeb.BlogpostView do
  use BlogWeb, :view
  alias BlogWeb.BlogpostView

  def render("index.json", %{blogposts: blogposts}) do
    %{data: render_many(blogposts, BlogpostView, "blogpost.json")}
  end

  def render("show.json", %{blogpost: blogpost}) do
    %{data: render_one(blogpost, BlogpostView, "blogpost.json")}
  end

  def render("blogpost.json", %{blogpost: blogpost}) do
    %{
      id: blogpost.id,
      title: blogpost.title,
      description: blogpost.description,
      text: blogpost.text,
      slug: blogpost.slug,
      published: blogpost.published,
      user_id: blogpost.user_id
    }
  end
end
