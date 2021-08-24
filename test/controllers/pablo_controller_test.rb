require "test_helper"

class PabloControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pablo_index_url
    assert_response :success
  end
end
