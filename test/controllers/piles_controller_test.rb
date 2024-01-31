require "test_helper"

class PilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @pile = piles(:one)
  end

  test "should get index" do
    get piles_url
    assert_response :success
  end

  test "should get new" do
    get new_pile_url
    assert_response :success
  end

  test "should create pile" do
    assert_difference("Pile.count") do
      post piles_url, params: { pile: {  } }
    end

    assert_redirected_to pile_url(Pile.last)
  end

  test "should show pile" do
    get pile_url(@pile)
    assert_response :success
  end

  test "should get edit" do
    get edit_pile_url(@pile)
    assert_response :success
  end

  test "should update pile" do
    patch pile_url(@pile), params: { pile: {  } }
    assert_redirected_to pile_url(@pile)
  end

  test "should destroy pile" do
    assert_difference("Pile.count", -1) do
      delete pile_url(@pile)
    end

    assert_redirected_to piles_url
  end
end
