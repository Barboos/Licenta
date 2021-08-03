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

ActiveRecord::Schema.define(version: 2021_08_03_163329) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "apartaments", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.float "price"
    t.integer "no_of_rooms"
    t.integer "surface"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.string "county"
    t.string "city"
    t.integer "no_of_bathrooms"
    t.integer "no_of_parking"
    t.integer "no_of_terraces"
    t.string "age"
    t.string "partitioning"
    t.index ["city"], name: "index_apartaments_on_city"
    t.index ["county"], name: "index_apartaments_on_county"
    t.index ["user_id"], name: "index_apartaments_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "password_digest"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
