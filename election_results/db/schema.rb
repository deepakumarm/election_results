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

ActiveRecord::Schema.define(version: 2019_05_30_073205) do

  create_table "candidates", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.bigint "constituency_id"
    t.bigint "party_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "no_of_votes"
    t.index ["constituency_id"], name: "index_candidates_on_constituency_id"
    t.index ["party_id"], name: "index_candidates_on_party_id"
  end

  create_table "constituencies", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.decimal "no_of_candidates", precision: 10
    t.bigint "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "no_of_voters"
    t.bigint "candidates_id"
    t.index ["candidates_id"], name: "index_constituencies_on_candidates_id"
    t.index ["state_id"], name: "index_constituencies_on_state_id"
  end

  create_table "parties", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "no_of_constituencies"
  end

  create_table "states", options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.decimal "no_of_constituencies", precision: 10
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "party_id"
    t.index ["party_id"], name: "index_states_on_party_id"
  end

  add_foreign_key "candidates", "constituencies"
  add_foreign_key "candidates", "parties"
  add_foreign_key "constituencies", "candidates", column: "candidates_id"
  add_foreign_key "constituencies", "states"
  add_foreign_key "states", "parties"
end
