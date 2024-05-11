class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :room
  validates :user_id, presence: true
  validates :user_id, :room_id, :check_in, :check_out, presence: true
  validate :room_availability

  # define the rooms method for the Booking object
  def status
    room.room_status
  end

  def city
    room.room_city
  end

  def rooms
    room.room_address
  end

  private

  def room_availability
    # check if the room is available for the given time range
    overlapping_bookings = Booking.where(room_id: room_id).where.not(id: id).where(
    '(? <= check_out) AND (check_in <= ?)', check_in, check_out
    )

    # If there are any overlapping reservations, add an error
    if overlapping_bookings.any?
      errors.add(:base, "The room is not available for the selected dates.")
    end
  end
end
