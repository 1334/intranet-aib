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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121205113344) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "categorizations", :force => true do |t|
    t.integer  "project_id"
    t.integer  "category_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "categorizations", ["category_id"], :name => "index_categorizations_on_category_id"
  add_index "categorizations", ["project_id"], :name => "index_categorizations_on_project_id"

  create_table "collaborations", :force => true do |t|
    t.integer  "project_id"
    t.integer  "participant_id"
    t.string   "role"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "collaborations", ["participant_id"], :name => "index_collaborations_on_participant_id"
  add_index "collaborations", ["project_id"], :name => "index_collaborations_on_project_id"

  create_table "diaries", :force => true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "diaries", ["trackable_id"], :name => "index_diaries_on_trackable_id"

  create_table "entries", :force => true do |t|
    t.integer  "diary_id"
    t.date     "date"
    t.string   "entry_type"
    t.string   "responsible"
    t.string   "subject"
    t.text     "comments"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
  end

  add_index "entries", ["diary_id"], :name => "index_entries_on_diary_id"

  create_table "participants", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "project_translations", :force => true do |t|
    t.integer  "project_id"
    t.string   "locale"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "project_translations", ["locale"], :name => "index_project_translations_on_locale"
  add_index "project_translations", ["project_id"], :name => "index_project_translations_on_project_id"

  create_table "projects", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "status"
    t.string   "commission"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.string   "start_year"
    t.string   "end_year"
    t.decimal  "gfa"
    t.decimal  "exterior_area"
    t.decimal  "budget"
    t.boolean  "published"
  end

  add_index "projects", ["code"], :name => "index_projects_on_code"

  create_table "timesheets", :force => true do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.date     "date"
    t.string   "daily_hours"
    t.string   "total_hours"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "timesheets", ["project_id"], :name => "index_timesheets_on_project_id"
  add_index "timesheets", ["user_id", "project_id", "date"], :name => "index_timesheets_on_user_id_and_project_id_and_date"
  add_index "timesheets", ["user_id"], :name => "index_timesheets_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "auth_token"
    t.boolean  "admin"
  end

end
