class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :type
      t.integer :cost
      t.string :location
      t.belongs_to :mood, foreign_key: true
      t.timestamps
    end
  end
end
