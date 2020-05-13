defmodule MyApp.Repo.Migrations.CreateCalendars do
  use Ecto.Migration

  def change do
    create table(:calendars, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :enabled, :boolean, default: false, null: false

      timestamps()
    end

  end
end
