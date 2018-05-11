defmodule BlogWeb.AuthController do
  require Logger
  use BlogWeb, :controller
  plug(Ueberauth)

  alias Blog.User
  alias Blog.Repo
  alias Blog.Auth

  def index(conn, _params) do
    users = Auth.list_users()
    render(conn, "index.json", users: users)
    # json(conn, users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Auth.get_user!(id)
    render(conn, "show.json", user: user)
    # json(conn, user: user)
  end

  def new(%{assigns: %{ueberauth_auth: auth}} = conn, _params) do
    user_params = %{
      token: auth.credentials.token,
      first_name: auth.info.first_name,
      last_name: auth.info.last_name,
      email: auth.info.email,
      provider: "google",
      is_active: true
    }

    changeset = User.changeset(%User{}, user_params)

    create(conn, changeset)
  end

  def create(conn, changeset) do
    case insert_or_update_user(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Thank you for signing in!")
        |> put_session(:user_id, user.id)
        |> redirect(to: page_path(conn, :index))

      {:error, _reason} ->
        conn
        |> put_flash(:error, "Error signing in")
        |> redirect(to: page_path(conn, :index))
    end
  end

  defp insert_or_update_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)

      user ->
        Logger.info("Loggin out: #{inspect(user)}")

        change_params = %{
          token: changeset.changes.token,
          first_name: changeset.changes.first_name,
          last_name: changeset.changes.last_name,
          email: changeset.changes.email,
          provider: changeset.changes.provider,
          is_active: true
        }

        user
        |> User.changeset(change_params)
        |> Repo.update()

        {:ok, user}
    end
  end

  def delete(conn, _params) do
    case Repo.get_by(User, id: get_session(conn, :user_id)) do
      nil ->
        Logger.info("Loggin out not existing user...")

      user ->
        Logger.info("Loggin out: #{inspect(user)}")

        change_params = %{
          token: "",
          first_name: user.first_name,
          last_name: user.last_name,
          email: user.email,
          provider: "",
          is_active: false
        }

        user
        |> User.changeset(change_params)
        |> Repo.update()
    end

    conn
    |> configure_session(drop: true)
    |> redirect(to: page_path(conn, :index))
  end

  def get_user_session_data(conn, _params) do
    conn = fetch_session(conn)

    user = get_session(conn, :user_id)
    json(conn, %{user: user})
  end
end
