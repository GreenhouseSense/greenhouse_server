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

ActiveRecord::Schema.define(version: 20180819145035) do

  create_table "decisions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "description", null: false
    t.string "origin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "readings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float "air_humidity", null: false ,limit: 24
    t.float "air_temperature", null: false , limit: 24
    t.float "soil_moisture", null: false , limit: 24
    t.float "red_light_intensity", null: false , limit: 24
    t.float "blue_light_intensity", null: false , limit: 24
    t.float "green_light_intensity", null: false , limit: 24
    t.float "outside_light_intensity", null: false , limit: 24
    t.boolean "fan_status", null: false 
    t.float "roof_door_position", null: false , limit: 24
    t.boolean "front_door_status", null: false 
    t.boolean "wattering_status", null: false 
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
