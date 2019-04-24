class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :foodtype
      t.string :foodimage
      t.integer :cost
      t.string :location
      t.timestamps
    end
  end
end
