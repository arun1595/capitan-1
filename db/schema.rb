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

ActiveRecord::Schema.define(version: 20151110151258) do

  create_table "answers", force: :cascade do |t|
    t.integer  "page_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.string   "result",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "answers", ["page_id"], name: "index_answers_on_page_id", using: :btree
  add_index "answers", ["user_id"], name: "index_answers_on_user_id", using: :btree

  create_table "authentication_providers", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "authentication_providers", ["name"], name: "index_name_on_authentication_providers", using: :btree

  create_table "branches", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "code",       limit: 255
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",                          limit: 255
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.text     "description",                   limit: 65535
    t.string   "avatar_file_name",              limit: 255
    t.string   "avatar_content_type",           limit: 255
    t.integer  "avatar_file_size",              limit: 4
    t.datetime "avatar_updated_at"
    t.string   "color",                         limit: 255
    t.string   "background_image_file_name",    limit: 255
    t.string   "background_image_content_type", limit: 255
    t.integer  "background_image_file_size",    limit: 4
    t.datetime "background_image_updated_at"
  end

  create_table "elements", force: :cascade do |t|
    t.integer  "course_id",   limit: 4
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "elements", ["course_id"], name: "index_elements_on_course_id", using: :btree

  create_table "options", force: :cascade do |t|
    t.string   "description", limit: 255
    t.integer  "question_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.boolean  "correct",     limit: 1
  end

  add_index "options", ["question_id"], name: "index_options_on_question_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.string   "title",        limit: 255
    t.integer  "unit_id",      limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.string   "page_type",    limit: 255
    t.integer  "sequence",     limit: 4
    t.text     "instructions", limit: 65535
    t.text     "html",         limit: 65535
  end

  add_index "pages", ["unit_id"], name: "index_pages_on_unit_id", using: :btree

  create_table "pages_videos", id: false, force: :cascade do |t|
    t.integer "page_id",  limit: 4, null: false
    t.integer "video_id", limit: 4, null: false
  end

  create_table "question_groups", force: :cascade do |t|
    t.integer  "page_id",     limit: 4
    t.integer  "question_id", limit: 4
    t.integer  "sequence",    limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "question_groups", ["page_id"], name: "index_question_groups_on_page_id", using: :btree
  add_index "question_groups", ["question_id"], name: "index_question_groups_on_question_id", using: :btree

  create_table "questions", force: :cascade do |t|
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "units", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.integer  "course_id",   limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "units", ["course_id"], name: "index_units_on_course_id", using: :btree

  create_table "user_authentications", force: :cascade do |t|
    t.integer  "user_id",                    limit: 4
    t.integer  "authentication_provider_id", limit: 4
    t.string   "uid",                        limit: 255
    t.string   "token",                      limit: 255
    t.datetime "token_expires_at"
    t.text     "params",                     limit: 65535
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "user_authentications", ["authentication_provider_id"], name: "index_user_authentications_on_authentication_provider_id", using: :btree
  add_index "user_authentications", ["user_id"], name: "index_user_authentications_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.boolean  "admin",                  limit: 1,   default: false
    t.string   "dni",                    limit: 255,                 null: false
    t.string   "code",                   limit: 255
    t.string   "name",                   limit: 255,                 null: false
    t.string   "lastname1",              limit: 255,                 null: false
    t.string   "lastname2",              limit: 255,                 null: false
    t.integer  "age",                    limit: 4,                   null: false
    t.string   "district",               limit: 255,                 null: false
    t.string   "facebook_username",      limit: 255
    t.string   "phone1",                 limit: 255,                 null: false
    t.string   "phone2",                 limit: 255
    t.integer  "branch_id",              limit: 4
  end

  add_index "users", ["branch_id"], name: "index_users_on_branch_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "youtube",    limit: 255
  end

  add_foreign_key "answers", "pages"
  add_foreign_key "answers", "users"
  add_foreign_key "elements", "courses"
  add_foreign_key "options", "questions"
  add_foreign_key "pages", "units"
  add_foreign_key "question_groups", "pages"
  add_foreign_key "question_groups", "questions"
  add_foreign_key "units", "courses"
  add_foreign_key "users", "branches"
end