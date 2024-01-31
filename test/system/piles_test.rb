require "application_system_test_case"

class PilesTest < ApplicationSystemTestCase
  setup do
    @pile = piles(:one)
  end

  test "visiting the index" do
    visit piles_url
    assert_selector "h1", text: "Piles"
  end

  test "should create pile" do
    visit piles_url
    click_on "New pile"

    click_on "Create Pile"

    assert_text "Pile was successfully created"
    click_on "Back"
  end

  test "should update Pile" do
    visit pile_url(@pile)
    click_on "Edit this pile", match: :first

    click_on "Update Pile"

    assert_text "Pile was successfully updated"
    click_on "Back"
  end

  test "should destroy Pile" do
    visit pile_url(@pile)
    click_on "Destroy this pile", match: :first

    assert_text "Pile was successfully destroyed"
  end
end
