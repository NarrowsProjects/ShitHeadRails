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

ActiveRecord::Schema[7.1].define(version: 2024_01_31_150540) do
  create_table "cards", force: :cascade do |t|
    t.integer "weight", default: 2
    t.integer "color"
    t.text "description"
    t.integer "pile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pile_id"], name: "index_cards_on_pile_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.decimal "number_of_players"
    t.integer "void_pile_id"
    t.integer "store_pile_id"
    t.integer "game_pile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_pile_id"], name: "index_games_on_game_pile_id"
    t.index ["store_pile_id"], name: "index_games_on_store_pile_id"
    t.index ["void_pile_id"], name: "index_games_on_void_pile_id"
  end

  create_table "piles", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.integer "game_id"
    t.integer "hand_pile_id"
    t.integer "face_down_pile_id"
    t.integer "face_up_pile_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["face_down_pile_id"], name: "index_players_on_face_down_pile_id"
    t.index ["face_up_pile_id"], name: "index_players_on_face_up_pile_id"
    t.index ["game_id"], name: "index_players_on_game_id"
    t.index ["hand_pile_id"], name: "index_players_on_hand_pile_id"
  end

  add_foreign_key "cards", "piles"
  add_foreign_key "games", "piles", column: "game_pile_id"
  add_foreign_key "games", "piles", column: "store_pile_id"
  add_foreign_key "games", "piles", column: "void_pile_id"
  add_foreign_key "players", "games"
  add_foreign_key "players", "games", on_delete: :nullify
  add_foreign_key "players", "piles", column: "face_down_pile_id"
  add_foreign_key "players", "piles", column: "face_up_pile_id"
  add_foreign_key "players", "piles", column: "hand_pile_id"
end
