require "test_helper"

class RoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @room = rooms(:one)
  end

  test "should get index" do
    get rooms_url
    assert_response :success
  end

  test "should get new" do
    get new_room_url
    assert_response :success
  end

  test "should create room" do
    assert_difference("Room.count") do
      post rooms_url, params: { room: { bed_size: @room.bed_size, number_of_beds: @room.number_of_beds, room_address: @room.room_address, room_city: @room.room_city, room_class: @room.room_class, room_country: @room.room_country, room_description: @room.room_description, room_name: @room.room_name, room_phone: @room.room_phone, room_picture: @room.room_picture, room_price: @room.room_price, room_size: @room.room_size, room_smoke: @room.room_smoke, room_state: @room.room_state, room_status: @room.room_status, room_zip: @room.room_zip } }
    end

    assert_redirected_to room_url(Room.last)
  end

  test "should show room" do
    get room_url(@room)
    assert_response :success
  end

  test "should get edit" do
    get edit_room_url(@room)
    assert_response :success
  end

  test "should update room" do
    patch room_url(@room), params: { room: { bed_size: @room.bed_size, number_of_beds: @room.number_of_beds, room_address: @room.room_address, room_city: @room.room_city, room_class: @room.room_class, room_country: @room.room_country, room_description: @room.room_description, room_name: @room.room_name, room_phone: @room.room_phone, room_picture: @room.room_picture, room_price: @room.room_price, room_size: @room.room_size, room_smoke: @room.room_smoke, room_state: @room.room_state, room_status: @room.room_status, room_zip: @room.room_zip } }
    assert_redirected_to room_url(@room)
  end

  test "should destroy room" do
    assert_difference("Room.count", -1) do
      delete room_url(@room)
    end

    assert_redirected_to rooms_url
  end
end
