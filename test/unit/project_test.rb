require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  test "factiry is valid" do
    project = FactoryGirl.build(:project)
    assert project.valid?, project.errors.messages
  end

  test "it responds to given methods" do
    project = Project.new

    assert project.respond_to?(:code)
    assert project.respond_to?(:name)
    assert project.respond_to?(:description)
    assert project.respond_to?(:status)
    assert project.respond_to?(:commission)
    assert project.respond_to?(:address)
    assert project.respond_to?(:city)
    assert project.respond_to?(:state)
    assert project.respond_to?(:country)
    assert project.respond_to?(:start_year)
    assert project.respond_to?(:end_year)
    assert project.respond_to?(:gfa)
    assert project.respond_to?(:exterior_area)
    assert project.respond_to?(:budget)
  end
end
