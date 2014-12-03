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

ActiveRecord::Schema.define(version: 20141203184134) do

  create_table "open_source_code_libraries", force: true do |t|
    t.string   "platform",                        null: false
    t.string   "name",                            null: false
    t.integer  "downloads_count"
    t.string   "current_version"
    t.integer  "current_version_downloads_count"
    t.string   "authors"
    t.string   "info"
    t.text     "licenses"
    t.string   "project_uri"
    t.string   "gem_uri"
    t.string   "homepage_uri"
    t.string   "wiki_uri"
    t.string   "documentation_uri"
    t.string   "mailing_list_uri"
    t.string   "source_code_uri"
    t.string   "bug_tracker_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_source_code_libraries", ["name"], name: "index_open_source_code_libraries_on_name", using: :btree
  add_index "open_source_code_libraries", ["platform", "name"], name: "index_open_source_code_libraries_on_platform_and_name", unique: true, using: :btree
  add_index "open_source_code_libraries", ["platform"], name: "index_open_source_code_libraries_on_platform", using: :btree

  create_table "rubygem_download_counts", force: true do |t|
    t.integer  "rubygem_id",      null: false
    t.integer  "total_downloads", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rubygem_download_counts", ["rubygem_id"], name: "index_rubygem_download_counts_on_rubygem_id", using: :btree

  create_table "rubygem_versions", force: true do |t|
    t.string   "rubygem_name", null: false
    t.string   "number",       null: false
    t.text     "authors"
    t.datetime "built_at"
    t.text     "description"
    t.string   "summary"
    t.boolean  "prerelease"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rubygem_versions", ["number"], name: "index_rubygem_versions_on_number", using: :btree
  add_index "rubygem_versions", ["rubygem_name"], name: "index_rubygem_versions_on_rubygem_name", using: :btree

  create_table "rubygems", force: true do |t|
    t.string   "name",              null: false
    t.string   "authors"
    t.text     "info"
    t.text     "licenses"
    t.text     "project_uri"
    t.text     "gem_uri"
    t.text     "homepage_uri"
    t.text     "wiki_uri"
    t.text     "documentation_uri"
    t.text     "mailing_list_uri"
    t.text     "source_code_uri"
    t.text     "bug_tracker_uri"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rubygems", ["name"], name: "index_rubygems_on_name", unique: true, using: :btree

end
