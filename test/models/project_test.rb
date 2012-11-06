require 'minitest_helper'

class ProjectTest < MiniTest::Rails::ActiveSupport::TestCase
  def test_it_responds_to_methods
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
    assert project.respond_to?(:started_at)
    assert project.respond_to?(:ended_at)
    assert project.respond_to?(:gfa)
    assert project.respond_to?(:exterior_area)
    assert project.respond_to?(:budget)
  end

  def test_valid_fixture_is_valid
    project = projects(:valid)
    assert project.valid?
  end

end

