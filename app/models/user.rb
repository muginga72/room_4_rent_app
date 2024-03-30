class User < ApplicationRecord
  enum role: [:regular, :admin]

  has_secure_password
  validates :email, presence: true, uniqueness: true

  # has_one_attached :avatar
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end