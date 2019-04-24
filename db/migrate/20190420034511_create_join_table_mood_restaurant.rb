class CreateJoinTableMoodRestaurant < ActiveRecord::Migration[5.2]
  def change
    create_join_table :moods, :restaurants do |t|
       t.index [:mood_id, :restaurant_id]
       t.index [:restaurant_id, :mood_id]
    end
  end
end
