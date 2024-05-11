class Room < ApplicationRecord
  attr_accessor :coming_soon # Define the coming_soon attribute

  has_one_attached :room_picture
  belongs_to :user
  has_many :bookings

  validates :room_address, presence: true

  # Add the 'booked' attribute
  attribute :booked, :boolean, default: false

  def owner
    user # Return the associated user (owner)
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
