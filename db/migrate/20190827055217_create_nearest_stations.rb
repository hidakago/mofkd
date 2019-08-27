class CreateNearestStations < ActiveRecord::Migration[5.0]
  def change
    create_table :nearest_stations do |t|
      t.string :route_name, :null => false, :default => 'なし'
      t.string :station_name, :null => false, :default => 'なし'
      t.integer :walking_time, :null => false, :default => 0

      t.timestamps
    end
  end
end
