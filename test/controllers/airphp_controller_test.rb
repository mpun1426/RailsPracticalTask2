require "test_helper"

class AirphpControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get airphp_index_url
    assert_response :success
  end
end
