require "application_system_test_case"

class WorkordersTest < ApplicationSystemTestCase
  setup do
    @workorder = workorders(:one)
  end

  test "visiting the index" do
    visit workorders_url
    assert_selector "h1", text: "Workorders"
  end

  test "creating a Workorder" do
    visit workorders_url
    click_on "New Workorder"

    fill_in "Duration", with: @workorder.duration
    fill_in "Price", with: @workorder.price
    fill_in "Time", with: @workorder.time
    click_on "Create Workorder"

    assert_text "Workorder was successfully created"
    click_on "Back"
  end

  test "updating a Workorder" do
    visit workorders_url
    click_on "Edit", match: :first

    fill_in "Duration", with: @workorder.duration
    fill_in "Price", with: @workorder.price
    fill_in "Time", with: @workorder.time
    click_on "Update Workorder"

    assert_text "Workorder was successfully updated"
    click_on "Back"
  end

  test "destroying a Workorder" do
    visit workorders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Workorder was successfully destroyed"
  end
end
