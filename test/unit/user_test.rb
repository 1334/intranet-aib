require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test ":valid fixture is valid" do
    user = users(:valid)
    assert user.valid?, ":valid fixture must be valid"
  end

  test "#authenticate returns false with invalid data" do
    assert_equal false, User.authenticate('wronguser', 'wrongpassowrd')
    assert_equal false, User.authenticate('', '')
  end
end
