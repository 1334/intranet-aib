require "test_helper"

class TimesheetTest < ActiveSupport::TestCase
  test "valid fixture is valid" do
    assert timesheets(:valid).valid?
  end

  test "is invalid without a project" do
    t=timesheets(:valid)
    t.project = nil
    refute t.valid?
  end

  test "is invalid without a date" do
    t=timesheets(:valid)
    t.date = nil
    refute t.valid?
  end

  test "is invalid without a user" do
    t=timesheets(:valid)
    t.user = nil
    refute t.valid?
  end

  test "[projec, user, date] act as unique keys" do
    t = timesheets(:valid)
    t1 = t.dup
    t1.save

    assert_includes t1.errors.keys, :project_id
  end

  test "new records have daily_hours initialized as array" do
    assert_kind_of Array, Timesheet.new.daily_hours
  end

  test "new records have daily_hours initialized with proper values" do
    a = Array.new(32,0.0)
    assert_equal a, Timesheet.new.daily_hours
  end
end
