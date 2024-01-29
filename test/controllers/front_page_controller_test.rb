require "test_helper"

class FrontPageControllerTest < ActionDispatch::IntegrationTest
  test "should get frontpage" do
    get front_page_frontpage_url
    assert_response :success
  end
end
