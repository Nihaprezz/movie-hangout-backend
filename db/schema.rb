# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_02_172134) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "genre_joints", force: :cascade do |t|
    t.integer "movie_id"
    t.integer "genre_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "genres", force: :cascade do |t|
    t.integer "genre_API_ID"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movie_lists", force: :cascade do |t|
    t.integer "user_id"
    t.integer "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "backdrop_path"
    t.integer "budget"
    t.integer "genre_joint"
    t.string "home_path"
    t.integer "movieAPI_ID"
    t.integer "Imdb_ID"
    t.string "original_title"
    t.string "overview"
    t.string "poster_path"
    t.integer "release_date"
    t.integer "revenue"
    t.integer "runtime"
    t.boolean "video"
    t.float "vote_average"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.string "bio"
    t.string "avatar"
    t.string "location"
    t.string "favortie_genre"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
