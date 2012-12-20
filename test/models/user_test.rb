require 'minitest_helper'

class UserTest < MiniTest::Rails::ActiveSupport::TestCase
  context "it rocks" do
    def test_vaild_fisture_is_valid
      assert users(:valid).valid?
    end
  end
end
