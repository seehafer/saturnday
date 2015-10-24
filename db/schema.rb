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

ActiveRecord::Schema.define(version: 20151024202517) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "attendees", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "zipcode"
    t.integer  "organizer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "attendees", ["organizer_id"], name: "index_attendees_on_organizer_id", using: :btree

  create_table "organizers", force: :cascade do |t|
    t.string    "name"
    t.string    "email"
    t.string    "club_name"
    t.string    "secondary_name"
    t.string    "secondary_email"
    t.string    "address"
    t.string    "city"
    t.string    "state"
    t.string    "zipcode"
    t.integer   "num_scopes"
    t.integer   "max_attendees"
    t.integer   "num_attendees"
    t.datetime  "created_at",                                                               null: false
    t.datetime  "updated_at",                                                               null: false
    t.geography "location",        limit: {:srid=>4326, :type=>"point", :geographic=>true}
  end

end
