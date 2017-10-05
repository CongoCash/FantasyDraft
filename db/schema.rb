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

ActiveRecord::Schema.define(version: 20171004221518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.bigint "user_id"
    t.bigint "draft_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["draft_id"], name: "index_comments_on_draft_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "drafts", force: :cascade do |t|
    t.integer "order", default: [], array: true
    t.integer "next_pick_index"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "league_id"
    t.integer "history", default: [], array: true
    t.index ["league_id"], name: "index_drafts_on_league_id"
  end

  create_table "leagues", force: :cascade do |t|
    t.bigint "user_id"
    t.string "format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number_of_teams"
    t.string "name"
    t.index ["user_id"], name: "index_leagues_on_user_id"
  end

  create_table "player_stats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id", default: 0
    t.integer "pass_attempts", default: 0
    t.integer "pass_completions", default: 0
    t.integer "pass_yards", default: 0
    t.integer "pass_td", default: 0
    t.integer "pass_int", default: 0
    t.integer "rush_attempts", default: 0
    t.integer "rush_yards", default: 0
    t.integer "rush_td", default: 0
    t.integer "receptions", default: 0
    t.integer "receive_yards", default: 0
    t.integer "receive_td", default: 0
    t.integer "fumbles_lost", default: 0
  end

  create_table "player_teams", force: :cascade do |t|
    t.bigint "player_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["player_id"], name: "index_player_teams_on_player_id"
    t.index ["team_id"], name: "index_player_teams_on_team_id"
  end

  create_table "player_week_stats", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
    t.integer "pass_attempts"
    t.integer "pass_completions"
    t.integer "pass_yards"
    t.integer "pass_td"
    t.integer "pass_int"
    t.integer "rush_attempts"
    t.integer "rush_yards"
    t.integer "rush_td"
    t.integer "receptions"
    t.integer "receive_yards"
    t.integer "receive_td"
    t.integer "fumbles_lost"
    t.integer "week"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "nfl_team"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "player_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "league_id"
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "rank", default: 0
    t.integer "wins", default: 0
    t.integer "losses", default: 0
    t.integer "ties", default: 0
    t.decimal "points_for", default: "0.0"
    t.decimal "points_against", default: "0.0"
    t.integer "moves", default: 0
    t.index ["league_id"], name: "index_teams_on_league_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "drafts"
  add_foreign_key "comments", "users"
  add_foreign_key "drafts", "leagues"
  add_foreign_key "leagues", "users"
  add_foreign_key "player_teams", "players"
  add_foreign_key "player_teams", "teams"
  add_foreign_key "teams", "leagues"
  add_foreign_key "teams", "users"
end
