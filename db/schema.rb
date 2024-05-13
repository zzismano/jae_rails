# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_05_13_181141) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text "subcategories"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leisures", force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "venue_id", null: false
    t.string "picture"
    t.string "link"
    t.string "title"
    t.string "subtitle"
    t.string "director"
    t.string "country"
    t.text "description"
    t.string "features"
    t.integer "min_age"
    t.integer "duration"
    t.time "time"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_leisures_on_category_id"
    t.index ["venue_id"], name: "index_leisures_on_venue_id"
  end

  create_table "leisures_genres", force: :cascade do |t|
    t.integer "leisure_id", null: false
    t.integer "genre_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_leisures_genres_on_genre_id"
    t.index ["leisure_id"], name: "index_leisures_genres_on_leisure_id"
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "capacity"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "leisures", "categories"
  add_foreign_key "leisures", "venues"
  add_foreign_key "leisures_genres", "genres"
  add_foreign_key "leisures_genres", "leisures"
end