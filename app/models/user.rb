class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :cars
  has_many :car_bookings, through: :cars, source: "Booking" # car I own
  has_many :my_bookings, source: "Booking" # cars I bookings

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
