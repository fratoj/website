defmodule BlogWeb.AuthController do
  use BlogWeb, :controller
  plug(Ueberauth)
end
