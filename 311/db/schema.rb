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

ActiveRecord::Schema.define(:version => 20130315150000) do

  create_table "credit_cards", :force => true do |t|
    t.integer "user_id"
    t.integer "num"
    t.integer "verification_num"
  end

  create_table "items", :force => true do |t|
    t.string  "description"
    t.string  "sku"
    t.boolean "is_current"
  end

  create_table "items_users", :force => true do |t|
    t.integer "item_id"
    t.integer "user_id"
  end

  create_table "users", :force => true do |t|
    t.string "name"
  end

end
