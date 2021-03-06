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

ActiveRecord::Schema.define(version: 2018_10_24_233419) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_type"
    t.integer "game_length"
    t.integer "game_status"
    t.boolean "access_treatement"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "session_name", limit: 255
    t.string "game_codename", limit: 255
    t.boolean "is_paused"
    t.integer "study_id"
    t.string "team_composition", limit: 255, default: "All Novices"
    t.index ["study_id"], name: "index_games_on_study_id"
  end

  create_table "measure_austins", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.integer "skill_1_player_levels", array: true
    t.integer "skill_2_player_levels", array: true
    t.integer "skill_3_player_levels", array: true
    t.integer "skill_4_player_levels", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "is_complete", default: false
  end

  create_table "measure_lewis", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.boolean "is_complete", default: false
    t.integer "responses_specialization", array: true
    t.integer "responses_credibility", array: true
    t.integer "responses_coordination", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "team_id"
    t.integer "responses_group_attraction", default: [], array: true
    t.integer "responses_group_integration", default: [], array: true
  end

  create_table "measure_workloads", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.boolean "is_complete", default: false
    t.integer "responses", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_monthly_reports", id: :serial, force: :cascade do |t|
    t.integer "player_id"
    t.integer "salary_generated"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "month_no"
    t.integer "skill_points_generated_1", default: 0
    t.integer "skill_points_generated_2", default: 0
    t.integer "skill_points_generated_3", default: 0
    t.integer "skill_points_generated_4", default: 0
  end

  create_table "players", id: :serial, force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.integer "salary_total"
    t.integer "skill_level", array: true
    t.integer "skill_total_points", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "member_no"
    t.string "player_name", limit: 255, default: ""
    t.string "player_screenname", limit: 255, default: ""
    t.string "gender", limit: 255, default: ""
    t.boolean "valid_age", default: false
    t.boolean "valid_read", default: false
    t.boolean "valid_consent", default: false
    t.integer "age", default: 18
    t.integer "failed_attempt_count", default: 0
  end

  create_table "project_monthly_reports", id: :serial, force: :cascade do |t|
    t.integer "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "expense_generated", default: 0
    t.integer "skill_1_stats_generated", default: 0
    t.integer "skill_2_stats_generated", default: 0
    t.integer "skill_3_stats_generated", default: 0
    t.integer "skill_4_stats_1_generated", default: 0
    t.integer "skill_4_stats_2_generated", default: 0
    t.integer "skill_4_stats_3_generated", default: 0
    t.integer "month_no"
  end

  create_table "projects", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.integer "game_id"
    t.integer "stats_total", array: true
    t.integer "rnd_stage", array: true
    t.integer "rnd_total_points", array: true
    t.integer "profit_total", array: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "project_name", limit: 255
    t.integer "users_total", default: [[0, 0, 0]], array: true
  end

  create_table "studies", id: :serial, force: :cascade do |t|
    t.string "title", limit: 255
    t.boolean "completed"
    t.string "slug", limit: 255
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "chat_link", limit: 255
    t.string "survey_link", limit: 255
    t.boolean "consent", default: true
  end

  create_table "team_memberships", id: :serial, force: :cascade do |t|
    t.integer "team_id"
    t.integer "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", id: :serial, force: :cascade do |t|
    t.string "team_name", limit: 255
    t.integer "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "email", limit: 255, default: "", null: false
    t.string "encrypted_password", limit: 255, default: "", null: false
    t.string "reset_password_token", limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip", limit: 255
    t.string "last_sign_in_ip", limit: 255
    t.string "name", limit: 255, default: "", null: false
    t.string "user_type", limit: 255, default: "participant", null: false
    t.string "user_status", limit: 255, default: "offline", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "player_name", limit: 255, default: ""
    t.string "player_screenname", limit: 255, default: ""
    t.string "gender", limit: 255, default: ""
    t.boolean "valid_age", default: false
    t.boolean "valid_read", default: false
    t.boolean "valid_consent", default: false
    t.boolean "tut0", default: false
    t.boolean "tut1", default: false
    t.boolean "tut2", default: false
    t.boolean "tut3", default: false
    t.integer "age", default: 18
    t.integer "failed_attempt_count", default: 0
    t.integer "researcher_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_schedules", id: :serial, force: :cascade do |t|
    t.integer "player_monthly_report_id"
    t.integer "project_monthly_report_id"
    t.integer "rank"
    t.string "skill_use", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "users", "users", column: "researcher_id"
end
