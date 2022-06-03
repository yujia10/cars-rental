class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :car
  validate :end_date_after_start_date
  enum status: {
    pending: 0,
    accepted: 1,
    declined: 2
  }

  private

  def end_date_after_start_date
    return if end_date.blank? || start_date.blank?

    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
 end

end

# date1 = Date.strptime("2022,02,01", "%y,%m,%d")
