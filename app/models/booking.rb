class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validates :start_date, presence: true
  validate :end_date_after_start_date
  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }
  before_save :calculate_total_price


  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
 end

 def calculate_total_price
  days = (end_date - start_date).to_i
  total_price = car.price_day * days
  self.attributes = {:total_price => total_price}
 end

end
