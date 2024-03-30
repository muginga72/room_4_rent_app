class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :room_size
      t.string :room_class
      t.string :room_status
      t.string :room_address
      t.string :room_city
      t.string :room_state
      t.string :room_zip
      t.string :room_country
      t.float :room_price
      t.string :room_description
      t.string :room_smoke
      t.integer :number_of_beds
      t.string :bed_size
      t.string :room_picture
      t.string :room_phone

      t.timestamps
    end
  end
end
