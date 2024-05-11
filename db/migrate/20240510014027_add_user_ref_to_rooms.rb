class AddUserRefToRooms < ActiveRecord::Migration[7.1]
  def up
    add_reference :rooms, :user, index: true
  
    # Set user_id for existing rooms
    user = User.first
    Room.all.each do |room|
      room.user_id = user.id
      room.save!
    end
  
    change_column_null :rooms, :user_id, false
    add_foreign_key :rooms, :users
  end
end
