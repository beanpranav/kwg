# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160112104732) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_type"
    t.integer  "game_length"
    t.integer  "game_status"
    t.boolean  "access_treatement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_name"
    t.string   "game_codename"
    t.boolean  "is_paused"
  end

  create_table "player_monthly_reports", force: true do |t|
    t.integer  "player_id"
    t.integer  "salary_generated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "month_no"
    t.integer  "skill_points_generated_1", default: 0
    t.integer  "skill_points_generated_2", default: 0
    t.integer  "skill_points_generated_3", default: 0
    t.integer  "skill_points_generated_4", default: 0
  end

  create_table "players", force: true do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.integer  "salary_total"
    t.integer  "skill_level",        array: true
    t.integer  "skill_total_points", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_no"
  end

  create_table "project_goals", force: true do |t|
    t.integer  "project_id"
    t.integer  "player_id"
    t.string   "goal_statement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_monthly_reports", force: true do |t|
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "expense_generated",         default: 0
    t.integer  "skill_1_stats_generated",   default: 0
    t.integer  "skill_2_stats_generated",   default: 0
    t.integer  "skill_3_stats_generated",   default: 0
    t.integer  "skill_4_stats_1_generated", default: 0
    t.integer  "skill_4_stats_2_generated", default: 0
    t.integer  "skill_4_stats_3_generated", default: 0
    t.integer  "month_no"
  end

  create_table "projects", force: true do |t|
    t.integer  "team_id"
    t.integer  "game_id"
    t.integer  "stats_total",                            array: true
    t.integer  "rnd_stage",                              array: true
    t.integer  "rnd_total_points",                       array: true
    t.integer  "profit_total",                           array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "project_name"
    t.integer  "users_total",      default: [[0, 0, 0]], array: true
  end

  create_table "team_memberships", force: true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_strategies", force: true do |t|
    t.integer  "team_id"
    t.integer  "player_id"
    t.string   "strategy_statement"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "team_name"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",            null: false
    t.string   "encrypted_password",     default: "",            null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,             null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name",                   default: "",            null: false
    t.string   "user_type",              default: "participant", null: false
    t.string   "user_status",            default: "offline",     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "work_schedules", force: true do |t|
    t.integer  "player_monthly_report_id"
    t.integer  "project_monthly_report_id"
    t.integer  "rank"
    t.string   "skill_use"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
