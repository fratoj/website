defmodule BlogWeb.AuthView do
  use BlogWeb, :view
  alias BlogWeb.AuthView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, AuthView, "user.json", as: :user)}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, AuthView, "user.json", as: :user)}
  end

  def render("user.json", %{user: user}) do
    %{
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name,
      provider: user.provider,
      token: user.token,
      is_active: user.is_active
      # blogposts: user.blogposts
    }
  end
end
