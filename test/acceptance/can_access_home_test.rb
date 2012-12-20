require "minitest_helper"

class CanAccessHomeTest < MiniTest::Rails::ActionDispatch::IntegrationTest
  def test_homepage_has_content
    visit root_path
    assert page.has_content?("intranet")
  end
end
