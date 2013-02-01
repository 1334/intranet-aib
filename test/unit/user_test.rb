require 'test_helper'

class UserTest < ActiveSupport::TestCase
  describe "it rocks" do
    def test_vaild_fixture_is_valid
      user = users(:valid)
      refute user.valid?, ":valid fixture must be valid"
    end
  end
end
