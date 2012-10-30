require 'minitest_helper'

class ProjectTest < MiniTest::Rails::ActiveSupport::TestCase
  def test_it_responds_to_methods
    assert_equal true, Project.new.respond_to?(:code)
    assert_equal true, Project.new.respond_to?(:name)
    assert_equal true, Project.new.respond_to?(:description)
    assert_equal true, Project.new.respond_to?(:status)
    assert_equal true, Project.new.respond_to?(:commission)
    assert_equal true, Project.new.respond_to?(:address)
    assert_equal true, Project.new.respond_to?(:city)
    assert_equal true, Project.new.respond_to?(:state)
    assert_equal true, Project.new.respond_to?(:country)
    assert_equal true, Project.new.respond_to?(:started_at)
    assert_equal true, Project.new.respond_to?(:ended_at)
    assert_equal true, Project.new.respond_to?(:gfa)
    assert_equal true, Project.new.respond_to?(:exterior_area)
    assert_equal true, Project.new.respond_to?(:budget)
  end
end

