class Room < ApplicationRecord
  has_one_attached :room_picture
  belongs_to :user
end
