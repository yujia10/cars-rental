class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :status, default: 0, null: false  # change to integer, pending option
      t.integer :total_price
      t.references :user, null: false, foreign_key: true
      t.references :car, null: false, foreign_key: true

      t.timestamps
    end
  end
end
