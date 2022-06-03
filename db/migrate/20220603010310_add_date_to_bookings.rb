class AddDateToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :date, :text
  end
end
