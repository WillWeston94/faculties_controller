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

ActiveRecord::Schema[7.0].define(version: 2023_08_29_201243) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "professor"
    t.string "course_name"
    t.boolean "gen_ed"
    t.integer "credits"
    t.string "start_date"
    t.string "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "faculty_id"
  end

  create_table "faculties", force: :cascade do |t|
    t.string "name"
    t.string "department"
    t.string "email"
    t.string "phone"
    t.boolean "office_hours"
    t.integer "years_instructing"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "faculty_courses", force: :cascade do |t|
    t.bigint "faculty_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_faculty_courses_on_course_id"
    t.index ["faculty_id"], name: "index_faculty_courses_on_faculty_id"
  end

  add_foreign_key "courses", "faculties", name: "courses_faculty_id_fkey"
  add_foreign_key "faculty_courses", "courses"
  add_foreign_key "faculty_courses", "faculties"
end
