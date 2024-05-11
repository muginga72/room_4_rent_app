class User < ApplicationRecord
  enum role: [:regular, :admin]
  has_many :rooms
  has_many :bookings
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end