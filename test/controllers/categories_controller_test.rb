require "minitest_helper"

class CategoriesControllerTest < MiniTest::Rails::ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
