class AddYearToCars < ActiveRecord::Migration[6.1]
  def change
    add_column :cars, :year, :integer
  end
end
