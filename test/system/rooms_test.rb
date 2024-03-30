require "application_system_test_case"

class RoomsTest < ApplicationSystemTestCase
  setup do
    @room = rooms(:one)
  end

  test "visiting the index" do
    visit rooms_url
    assert_selector "h1", text: "Rooms"
  end

  test "should create room" do
    visit rooms_url
    click_on "New room"

    fill_in "Bed size", with: @room.bed_size
    fill_in "Number of beds", with: @room.number_of_beds
    fill_in "Room address", with: @room.room_address
    fill_in "Room city", with: @room.room_city
    fill_in "Room class", with: @room.room_class
    fill_in "Room country", with: @room.room_country
    fill_in "Room description", with: @room.room_description
    fill_in "Room name", with: @room.room_name
    fill_in "Room phone", with: @room.room_phone
    fill_in "Room picture", with: @room.room_picture
    fill_in "Room price", with: @room.room_price
    fill_in "Room size", with: @room.room_size
    fill_in "Room smoke", with: @room.room_smoke
    fill_in "Room state", with: @room.room_state
    fill_in "Room status", with: @room.room_status
    fill_in "Room zip", with: @room.room_zip
    click_on "Create Room"

    assert_text "Room was successfully created"
    click_on "Back"
  end

  test "should update Room" do
    visit room_url(@room)
    click_on "Edit this room", match: :first

    fill_in "Bed size", with: @room.bed_size
    fill_in "Number of beds", with: @room.number_of_beds
    fill_in "Room address", with: @room.room_address
    fill_in "Room city", with: @room.room_city
    fill_in "Room class", with: @room.room_class
    fill_in "Room country", with: @room.room_country
    fill_in "Room description", with: @room.room_description
    fill_in "Room name", with: @room.room_name
    fill_in "Room phone", with: @room.room_phone
    fill_in "Room picture", with: @room.room_picture
    fill_in "Room price", with: @room.room_price
    fill_in "Room size", with: @room.room_size
    fill_in "Room smoke", with: @room.room_smoke
    fill_in "Room state", with: @room.room_state
    fill_in "Room status", with: @room.room_status
    fill_in "Room zip", with: @room.room_zip
    click_on "Update Room"

    assert_text "Room was successfully updated"
    click_on "Back"
  end

  test "should destroy Room" do
    visit room_url(@room)
    click_on "Destroy this room", match: :first

    assert_text "Room was successfully destroyed"
  end
end
