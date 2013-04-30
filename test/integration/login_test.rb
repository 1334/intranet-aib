require "test_helper"

class User
  def self.authenticate name, password
    User.new
  end
end

class LoginTest < ActionDispatch::IntegrationTest
  test "users can login" do
    visit root_path
    click_link "Log In"
    fill_in :name, with: 'testuser'
    fill_in :password, with: 'testpass'
    click_button "Log In"
    assert_equal root_path, current_path
    assert page.has_content?('successfully logged in')
  end
end
