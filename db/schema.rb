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

ActiveRecord::Schema.define(:version => 20100208095419) do

  create_table "attachments", :force => true do |t|
    t.binary   "data"
    t.string   "mime_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "member_id"
    t.string   "name"
    t.string   "purpose_code"
  end

  create_table "classes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", :force => true do |t|
    t.date     "event_date"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.time     "start_time"
    t.time     "end_time"
    t.string   "event_type"
  end

  create_table "lessons", :force => true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "taught_class_id"
    t.integer  "event_id"
  end

  create_table "members", :force => true do |t|
    t.string   "name"
    t.text     "summary"
    t.string   "email"
    t.binary   "picture"
    t.boolean  "is_admin"
    t.boolean  "is_teacher"
    t.boolean  "is_committee_member"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password"
    t.string   "password_confirmation"
    t.boolean  "show_email",            :default => false
  end

  create_table "news_items", :force => true do |t|
    t.date     "news_date"
    t.text     "news_text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pages", :force => true do |t|
    t.string   "page"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
  end

  create_table "taught_classes", :force => true do |t|
    t.string   "code"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "versions", :force => true do |t|
    t.integer  "versioned_id"
    t.string   "versioned_type"
    t.text     "changes"
    t.integer  "number"
    t.datetime "created_at"
  end

  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["versioned_type", "versioned_id"], :name => "index_versions_on_versioned_type_and_versioned_id"

end
