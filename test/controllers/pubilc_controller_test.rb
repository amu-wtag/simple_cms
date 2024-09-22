require "test_helper"

class PubilcControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pubilc_index_url
    assert_response :success
  end

  test "should get show" do
    get pubilc_show_url
    assert_response :success
  end
end
