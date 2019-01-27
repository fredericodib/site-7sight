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

ActiveRecord::Schema.define(version: 2019_01_15_192421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "acomodation_photos", force: :cascade do |t|
    t.bigint "acomodation_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["acomodation_id"], name: "index_acomodation_photos_on_acomodation_id"
  end

  create_table "acomodation_solicitations", force: :cascade do |t|
    t.bigint "solicitation_id"
    t.bigint "acomodation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "people", default: 1
    t.index ["acomodation_id"], name: "index_acomodation_solicitations_on_acomodation_id"
    t.index ["solicitation_id"], name: "index_acomodation_solicitations_on_solicitation_id"
  end

  create_table "acomodations", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "acomodation_type"
    t.integer "capacity"
    t.float "price"
    t.float "rate"
    t.text "peculiarity", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_acomodations_on_user_id"
  end

  create_table "avaliations", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "receiver_id"
    t.text "comment", default: ""
    t.boolean "visible", default: false
    t.float "rate"
    t.boolean "evaluated", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hostess_is_sender", default: true
    t.index ["user_id"], name: "index_avaliations_on_user_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "document_photos", force: :cascade do |t|
    t.bigint "user_id"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_document_photos_on_user_id"
  end

  create_table "house_photos", force: :cascade do |t|
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_house_photos_on_user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "interests_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "interest_id", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages_users", id: false, force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "language_id", null: false
  end

  create_table "pair_avaliations", force: :cascade do |t|
    t.bigint "avaliation_id"
    t.integer "traveler_avaliation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["avaliation_id"], name: "index_pair_avaliations_on_avaliation_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "profile_photo", default: false
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "solicitations", force: :cascade do |t|
    t.bigint "user_id"
    t.integer "host_id"
    t.integer "status", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "checkin"
    t.date "checkout"
    t.float "final_price"
    t.float "service_tax_price"
    t.float "sw_tax_price"
    t.integer "people_number", default: 1
    t.boolean "traveling_with_man"
    t.index ["user_id"], name: "index_solicitations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "token"
    t.string "email"
    t.string "password_digest"
    t.string "last_name"
    t.text "about", default: ""
    t.text "why_participate", default: ""
    t.string "phone", default: ""
    t.string "birthday", default: ""
    t.string "nationality", default: ""
    t.string "cpf", default: ""
    t.string "passport", default: ""
    t.boolean "hostess", default: false
    t.text "experience", default: ""
    t.text "visited_country", default: ""
    t.string "cep", default: ""
    t.string "logradouro", default: ""
    t.string "complement", default: ""
    t.string "neighborhood", default: ""
    t.string "location", default: ""
    t.string "uf", default: ""
    t.string "number", default: ""
    t.text "house_rules", default: ""
    t.boolean "male_in_house", default: false
    t.boolean "accept_male", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.string "facebook_token"
    t.string "google_token"
    t.boolean "valid_hostess_bool"
    t.decimal "rate", default: "0.0"
    t.string "bank_account", default: ""
    t.string "agency", default: ""
    t.string "bank_code", default: ""
    t.integer "strikes", default: 0
    t.string "bank_holder", default: ""
    t.string "holder_cpf", default: ""
    t.boolean "holder_is_hostess", default: false
    t.boolean "valid_sister_bool"
    t.integer "roles", default: 0
    t.boolean "verified_bool", default: false
  end

  add_foreign_key "acomodation_photos", "acomodations"
  add_foreign_key "acomodation_solicitations", "acomodations"
  add_foreign_key "acomodation_solicitations", "solicitations"
  add_foreign_key "acomodations", "users"
  add_foreign_key "avaliations", "users"
  add_foreign_key "document_photos", "users"
  add_foreign_key "house_photos", "users"
  add_foreign_key "pair_avaliations", "avaliations"
  add_foreign_key "photos", "users"
  add_foreign_key "solicitations", "users"
end
