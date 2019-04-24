# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_20_034511) do

  create_table "moods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moods_restaurants", id: false, force: :cascade do |t|
    t.integer "mood_id", null: false
    t.integer "restaurant_id", null: false
    t.index ["mood_id", "restaurant_id"], name: "index_moods_restaurants_on_mood_id_and_restaurant_id"
    t.index ["restaurant_id", "mood_id"], name: "index_moods_restaurants_on_restaurant_id_and_mood_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "foodtype"
    t.string "foodimage"
    t.integer "cost"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
