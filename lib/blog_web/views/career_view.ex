defmodule BlogWeb.CareerView do
  use BlogWeb, :view
  alias BlogWeb.CareerView

  def render("index.json", %{careers: careers}) do
    %{data: render_many(careers, CareerView, "career.json")}
  end

  def render("show.json", %{career: career}) do
    %{data: render_one(career, CareerView, "career.json")}
  end

  def render("career.json", %{career: career}) do
    %{id: career.id,
      title: career.title,
      text: career.text,
      url: career.url,
      active: career.active}
  end
end
