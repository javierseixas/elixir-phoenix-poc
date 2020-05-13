defmodule MyAppWeb.CalendarView do
  use MyAppWeb, :view
  alias MyAppWeb.CalendarView

  def render("index.json", %{calendars: calendars}) do
    %{data: render_many(calendars, CalendarView, "calendar.json")}
  end

  def render("show.json", %{calendar: calendar}) do
    %{data: render_one(calendar, CalendarView, "calendar.json")}
  end

  def render("calendar.json", %{calendar: calendar}) do
    %{id: calendar.id,
      name: calendar.name,
      enabled: calendar.enabled}
  end
end
