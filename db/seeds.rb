# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Mood.destroy_all
Restaurant.destroy_all

@mood_one = Mood.create!(
  name: "Happy"
)

@mood_two = Mood.create!(
  name: "Sad"
)

@mood_three = Mood.create!(
  name: "Rich"
)

@mood_four = Mood.create!(
  name: "Adventurous"
)

@rest = Restaurant.create!(
  name: "Star Kitchen",
  cost: 2,
  location: "Chicago",
  mood_names: @mood_one.name,
)
