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

ActiveRecord::Schema.define(version: 2018_12_03_144754) do

  create_table "default_items", force: :cascade do |t|
    t.string "name", null: false
    t.integer "hp", null: false
    t.integer "mp", null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.integer "lucky", null: false
    t.integer "money", null: false
    t.integer "xp", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "valeras", force: :cascade do |t|
    t.integer "hp"
    t.integer "mp"
    t.integer "attack"
    t.integer "defense"
    t.integer "lucky"
    t.integer "money"
    t.string "skill"
    t.integer "maxHp"
    t.integer "maxMp"
    t.integer "level"
    t.integer "xp"
    t.datetime "outTime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
