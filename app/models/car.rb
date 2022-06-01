class Car < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  #has_many :users, through: :bookings
  has_one_attached :photo

  validates :make, presence: true
  validates :model, presence: true
  validates :price_day, numericality: { only_integer: true }



end
