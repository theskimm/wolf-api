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

ActiveRecord::Schema.define(version: 2023_05_17_173033) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "journeys", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "journey_id"
    t.index ["journey_id"], name: "index_milestones_on_journey_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.integer "difficulty", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_milestone_id"
    t.bigint "status_id"
    t.index ["status_id"], name: "index_tasks_on_status_id"
    t.index ["user_milestone_id"], name: "index_tasks_on_user_milestone_id"
  end

  create_table "user_journeys", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "journey_id"
    t.index ["journey_id"], name: "index_user_journeys_on_journey_id"
    t.index ["user_id"], name: "index_user_journeys_on_user_id"
  end

  create_table "user_milestones", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_journey_id"
    t.bigint "status_id"
    t.index ["status_id"], name: "index_user_milestones_on_status_id"
    t.index ["user_journey_id"], name: "index_user_milestones_on_user_journey_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.datetime "birthdate", null: false
    t.string "city", null: false
    t.string "state", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "milestones", "journeys"
  add_foreign_key "tasks", "statuses"
  add_foreign_key "tasks", "user_milestones"
  add_foreign_key "user_journeys", "journeys"
  add_foreign_key "user_journeys", "users"
  add_foreign_key "user_milestones", "statuses"
  add_foreign_key "user_milestones", "user_journeys"
end
