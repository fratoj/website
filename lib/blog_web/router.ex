defmodule BlogWeb.Router do
  use BlogWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
    plug(Blog.Plugs.SetUser)
  end

  pipeline :api do
    plug(:accepts, ["json"])
  end

  scope "/", BlogWeb do
    # Use the default browser stack
    pipe_through(:browser)

    get("/", PageController, :index)
  end

  scope "/auth", BlogWeb do
    pipe_through(:browser)

    get("/signout", AuthController, :delete)
    get("/:provider", AuthController, :request)
    get("/:provider/callback", AuthController, :new)
  end

  # Other scopes may use custom stacks.
  scope "/api", BlogWeb do
    pipe_through(:api)
    get("/userdata", AuthController, :get_user_session_data)
    resources("/clients", ClientController)
    resources("/careers", CareerController)
  end
end
