defmodule MyApp.CalendarsTest do
  use MyApp.DataCase

  alias MyApp.Calendars

  describe "calendars" do
    alias MyApp.Calendars.Calendar

    @valid_attrs %{enabled: true, name: "some name"}
    @update_attrs %{enabled: false, name: "some updated name"}
    @invalid_attrs %{enabled: nil, name: nil}

    def calendar_fixture(attrs \\ %{}) do
      {:ok, calendar} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Calendars.create_calendar()

      calendar
    end

    test "list_calendars/0 returns all calendars" do
      calendar = calendar_fixture()
      assert Calendars.list_calendars() == [calendar]
    end

    test "get_calendar!/1 returns the calendar with given id" do
      calendar = calendar_fixture()
      assert Calendars.get_calendar!(calendar.id) == calendar
    end

    test "create_calendar/1 with valid data creates a calendar" do
      assert {:ok, %Calendar{} = calendar} = Calendars.create_calendar(@valid_attrs)
      assert calendar.enabled == true
      assert calendar.name == "some name"
    end

    test "create_calendar/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Calendars.create_calendar(@invalid_attrs)
    end

    test "update_calendar/2 with valid data updates the calendar" do
      calendar = calendar_fixture()
      assert {:ok, %Calendar{} = calendar} = Calendars.update_calendar(calendar, @update_attrs)
      assert calendar.enabled == false
      assert calendar.name == "some updated name"
    end

    test "update_calendar/2 with invalid data returns error changeset" do
      calendar = calendar_fixture()
      assert {:error, %Ecto.Changeset{}} = Calendars.update_calendar(calendar, @invalid_attrs)
      assert calendar == Calendars.get_calendar!(calendar.id)
    end

    test "delete_calendar/1 deletes the calendar" do
      calendar = calendar_fixture()
      assert {:ok, %Calendar{}} = Calendars.delete_calendar(calendar)
      assert_raise Ecto.NoResultsError, fn -> Calendars.get_calendar!(calendar.id) end
    end

    test "change_calendar/1 returns a calendar changeset" do
      calendar = calendar_fixture()
      assert %Ecto.Changeset{} = Calendars.change_calendar(calendar)
    end
  end
end
