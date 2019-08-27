class CreateRentals < ActiveRecord::Migration[5.0]
  def change
    create_table :rentals do |t|
      t.string :name, :null => false
      t.integer :rent, :null => false, :default => 0
      t.text :address, :null => false
      t.integer :age, :null => false, :default => 0
      t.text :note, :null => false, :default => 'なし'

      t.timestamps
    end
  end
end
