class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cars, dependent: :destroy
  has_many :car_bookings, through: :cars, source: "bookings" # car I own
  has_many :my_bookings, class_name: "Booking" # cars I bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
