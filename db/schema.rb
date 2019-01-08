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

ActiveRecord::Schema.define(version: 2018_12_17_083421) do

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "mp"
    t.integer "attack"
    t.integer "defense"
    t.integer "lucky"
    t.integer "money"
    t.integer "xp"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "hp"
    t.integer "mp"
    t.integer "attack"
    t.integer "defense"
    t.integer "lucky"
    t.integer "money"
    t.integer "xp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items_valeras", id: false, force: :cascade do |t|
    t.integer "valera_id", null: false
    t.integer "item_id", null: false
    t.index ["valera_id", "item_id"], name: "index_items_valeras_on_valera_id_and_item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "valeras", force: :cascade do |t|
    t.integer "hp"
    t.integer "mp"
    t.integer "attack"
    t.integer "defense"
    t.integer "lucky"
    t.integer "money"
    t.string "skill"
    t.integer "max_hp"
    t.integer "max_mp"
    t.integer "level"
    t.integer "xp"
    t.datetime "out_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_valeras_on_user_id"
  end

end
