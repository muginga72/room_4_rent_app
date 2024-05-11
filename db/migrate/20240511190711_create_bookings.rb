class CreateBookings < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings do |t|
      t.date :check_in
      t.date :check_out

      t.timestamps
    end
  end
end
