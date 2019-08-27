class AddRentalRefToNearestStation < ActiveRecord::Migration[5.0]
  def change
    add_reference :nearest_stations, :rental, foreign_key: true
  end
end
