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

ActiveRecord::Schema[8.1].define(version: 2026_10_05_181356) do
  create_table "chapters", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.integer "position"
    t.integer "work_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["work_id"], name: "index_chapters_on_work_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id", null: false
    t.string "commentable_type", null: false
    t.integer "commentable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "fandoms", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.string "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.text "bio"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  create_table "work_tags", force: :cascade do |t|
    t.integer "work_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_work_tags_on_tag_id"
    t.index ["work_id"], name: "index_work_tags_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "title"
    t.text "summary"
    t.string "work_type"
    t.string "rating"
    t.string "status"
    t.integer "user_id", null: false
    t.integer "fandom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fandom_id"], name: "index_works_on_fandom_id"
    t.index ["user_id"], name: "index_works_on_user_id"
  end

  add_foreign_key "chapters", "works"
  add_foreign_key "comments", "users"
  add_foreign_key "work_tags", "tags"
  add_foreign_key "work_tags", "works"
  add_foreign_key "works", "fandoms"
  add_foreign_key "works", "users"
end
