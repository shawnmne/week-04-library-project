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

ActiveRecord::Schema.define(version: 2) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "books", force: :cascade do |t|
    t.string  "title",      null: false
    t.string  "author",     null: false
    t.string  "isbn",       null: false
    t.integer "library_id"
    t.integer "patron_id"
  end

  create_table "libraries", force: :cascade do |t|
    t.string "branch_name",  null: false
    t.string "phone_number", null: false
    t.string "address",      null: false
  end

  create_table "patrons", force: :cascade do |t|
    t.string "name",  null: false
    t.string "email", null: false
  end

  create_table "staff_members", force: :cascade do |t|
    t.string  "name",       null: false
    t.string  "email",      null: false
    t.integer "library_id"
  end

end
