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

ActiveRecord::Schema.define(version: 2019_07_08_133654) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "histories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "status", default: 0
    t.text "description"
    t.datetime "deadline"
    t.integer "points"
    t.bigint "project_id", null: false
    t.bigint "requester_id", null: false
    t.bigint "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_histories_on_owner_id"
    t.index ["project_id"], name: "index_histories_on_project_id"
    t.index ["requester_id"], name: "index_histories_on_requester_id"
    t.index ["status"], name: "index_histories_on_status"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "manager_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manager_id"], name: "index_projects_on_manager_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description", null: false
    t.boolean "done", default: false
    t.bigint "history_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["history_id"], name: "index_tasks_on_history_id"
  end

  add_foreign_key "histories", "people", column: "owner_id"
  add_foreign_key "histories", "people", column: "requester_id"
  add_foreign_key "histories", "projects"
  add_foreign_key "projects", "people", column: "manager_id"
  add_foreign_key "tasks", "histories"
end
