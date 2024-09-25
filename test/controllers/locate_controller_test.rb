require "test_helper"

class LocateControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get locate_index_url
    assert_response :success
  end
end
