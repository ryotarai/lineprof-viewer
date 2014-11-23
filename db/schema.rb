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

ActiveRecord::Schema.define(version: 20141123121238) do

  create_table "profile_records", force: true do |t|
    t.integer  "profiled_file_id"
    t.integer  "line"
    t.integer  "wall"
    t.integer  "cpu"
    t.integer  "calls"
    t.integer  "allocations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_records", ["profiled_file_id"], name: "index_profile_records_on_profiled_file_id"

  create_table "profile_tags", force: true do |t|
    t.string   "key"
    t.string   "value"
    t.integer  "profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "profile_tags", ["profile_id"], name: "index_profile_tags_on_profile_id"

  create_table "profiled_files", force: true do |t|
    t.integer  "profile_id"
    t.string   "path"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "total_wall_time"
    t.integer  "child_wall_time"
    t.integer  "exclusive_wall_time"
    t.integer  "total_cpu_time"
    t.integer  "child_cpu_time"
    t.integer  "exclusive_cpu_time"
    t.integer  "allocations"
  end

  add_index "profiled_files", ["profile_id"], name: "index_profiled_files_on_profile_id"

  create_table "profiles", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "root_path"
  end

end
