defmodule MyApp.Calendars.Calendar do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "calendars" do
    field :enabled, :boolean, default: false
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(calendar, attrs) do
    calendar
    |> cast(attrs, [:name, :enabled])
    |> validate_required([:name, :enabled])
  end
end
