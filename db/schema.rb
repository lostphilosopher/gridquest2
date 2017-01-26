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

ActiveRecord::Schema.define(version: 20170126070603) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "boxes", force: :cascade do |t|
    t.integer  "x"
    t.integer  "y"
    t.string   "paths"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "grid_id"
    t.index ["grid_id"], name: "index_boxes_on_grid_id", using: :btree
  end

  create_table "games", force: :cascade do |t|
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "current_box_id"
  end

  create_table "grids", force: :cascade do |t|
    t.integer  "x_max"
    t.integer  "y_max"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "theme_id"
    t.integer  "seed_min",    null: false
    t.integer  "seed_max",    null: false
    t.index ["theme_id"], name: "index_items_on_theme_id", using: :btree
  end

  create_table "npcs", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "theme_id"
    t.integer  "seed_min",    null: false
    t.integer  "seed_max",    null: false
    t.index ["theme_id"], name: "index_npcs_on_theme_id", using: :btree
  end

  create_table "populations", force: :cascade do |t|
    t.integer  "health"
    t.integer  "seed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "box_id"
    t.integer  "npc_id"
    t.integer  "item_id"
    t.integer  "game_id"
    t.index ["box_id"], name: "index_populations_on_box_id", using: :btree
    t.index ["game_id"], name: "index_populations_on_game_id", using: :btree
    t.index ["item_id"], name: "index_populations_on_item_id", using: :btree
    t.index ["npc_id"], name: "index_populations_on_npc_id", using: :btree
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
