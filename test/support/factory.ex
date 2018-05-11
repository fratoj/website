defmodule Blog.Factory do
  use ExMachina.Ecto, repo: Blog.Repo

  def user_factory do
    %Blog.User{
      token: "ffnebyt73bich9",
      email: sequence(:email, &"email-#{&1}@example.com"),
      first_name: "Bruce",
      last_name: "Wayne",
      provider: "google"
    }
  end
end
