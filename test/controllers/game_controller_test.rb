require "test_helper"

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get tutorial" do
    get game_tutorial_url
    assert_response :success
  end

  test "should get rules" do
    get game_rules_url
    assert_response :success
  end

  test "should get initialization" do
    get game_initialization_url
    assert_response :success
  end
end
