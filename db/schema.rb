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

ActiveRecord::Schema.define(version: 2018_09_12_213104) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_type"
    t.integer "game_length"
    t.integer "game_status"
    t.boolean "access_treatement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "session_name"
    t.string "game_codename"
    t.boolean "is_paused"
    t.integer "study_id"
    t.string "team_composition", default: "All Novices"
    t.index ["study_id"], name: "index_games_on_study_id"
  end

  create_table "measure_austins", force: :cascade do |t|
    t.integer "player_id"
    t.integer "skill_1_player_levels", array: true
    t.integer "skill_2_player_levels", array: true
    t.integer "skill_3_player_levels", array: true
    t.integer "skill_4_player_levels", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_complete", default: false
  end

  create_table "measure_lewis", force: :cascade do |t|
    t.integer "player_id"
    t.boolean "is_complete", default: false
    t.integer "responses_specialization", array: true
    t.integer "responses_credibility", array: true
    t.integer "responses_coordination", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "team_id"
    t.integer "responses_group_attraction", default: [], array: true
    t.integer "responses_group_integration", default: [], array: true
  end

  create_table "measure_workloads", force: :cascade do |t|
    t.integer "player_id"
    t.boolean "is_complete", default: false
    t.integer "responses", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "player_monthly_reports", force: :cascade do |t|
    t.integer "player_id"
    t.integer "salary_generated"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "month_no"
    t.integer "skill_points_generated_1", default: 0
    t.integer "skill_points_generated_2", default: 0
    t.integer "skill_points_generated_3", default: 0
    t.integer "skill_points_generated_4", default: 0
  end

  create_table "players", force: :cascade do |t|
    t.integer "user_id"
    t.integer "game_id"
    t.integer "salary_total"
    t.integer "skill_level", array: true
    t.integer "skill_total_points", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "member_no"
    t.string "player_name", default: ""
    t.string "player_screenname", default: ""
    t.string "gender", default: ""
    t.boolean "valid_age", default: false
    t.boolean "valid_read", default: false
    t.boolean "valid_consent", default: false
    t.integer "age", default: 18
    t.integer "failed_attempt_count", default: 0
  end

  create_table "project_goals", force: :cascade do |t|
    t.integer "project_id"
    t.integer "player_id"
    t.string "goal_statement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "project_monthly_reports", force: :cascade do |t|
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "expense_generated", default: 0
    t.integer "skill_1_stats_generated", default: 0
    t.integer "skill_2_stats_generated", default: 0
    t.integer "skill_3_stats_generated", default: 0
    t.integer "skill_4_stats_1_generated", default: 0
    t.integer "skill_4_stats_2_generated", default: 0
    t.integer "skill_4_stats_3_generated", default: 0
    t.integer "month_no"
  end

  create_table "projects", force: :cascade do |t|
    t.integer "team_id"
    t.integer "game_id"
    t.integer "stats_total", array: true
    t.integer "rnd_stage", array: true
    t.integer "rnd_total_points", array: true
    t.integer "profit_total", array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "project_name"
    t.integer "users_total", default: [[0, 0, 0]], array: true
  end

  create_table "studies", force: :cascade do |t|
    t.string "title"
    t.boolean "completed"
    t.string "slug"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "chat_link"
    t.string "survey_link"
    t.boolean "consent", default: true
  end

  create_table "team_memberships", force: :cascade do |t|
    t.integer "team_id"
    t.integer "player_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "team_strategies", force: :cascade do |t|
    t.integer "team_id"
    t.integer "player_id"
    t.string "strategy_statement"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name", default: "", null: false
    t.string "user_type", default: "participant", null: false
    t.string "user_status", default: "offline", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "player_name", default: ""
    t.string "player_screenname", default: ""
    t.string "gender", default: ""
    t.boolean "valid_age", default: false
    t.boolean "valid_read", default: false
    t.boolean "valid_consent", default: false
    t.boolean "tut0", default: false
    t.boolean "tut1", default: false
    t.boolean "tut2", default: false
    t.boolean "tut3", default: false
    t.integer "age", default: 18
    t.integer "failed_attempt_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "work_schedules", force: :cascade do |t|
    t.integer "player_monthly_report_id"
    t.integer "project_monthly_report_id"
    t.integer "rank"
    t.string "skill_use"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
