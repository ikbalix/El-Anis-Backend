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

ActiveRecord::Schema.define(version: 20180803030721) do

  create_table "friendships", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "friendable_type"
    t.integer  "friendable_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "blocker_id"
    t.integer  "status"
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                                     default: "",      null: false
    t.string   "encrypted_password",                                        default: "",      null: false
    t.string   "provider",                                                  default: "email", null: false
    t.string   "uid",                                                       default: "",      null: false
    t.text     "tokens",              limit: 65535
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                                             default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                                  null: false
    t.datetime "updated_at",                                                                  null: false
    t.string   "firstname"
    t.string   "lastname"
    t.date     "date"
    t.string   "type_u"
    t.string   "avatar"
    t.string   "country"
    t.decimal  "latitude",                          precision: 8, scale: 6
    t.decimal  "longitude",                         precision: 8, scale: 6
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "volunteers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.integer  "volunteer_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["user_id"], name: "index_volunteers_on_user_id", using: :btree
    t.index ["volunteer_id"], name: "index_volunteers_on_volunteer_id", using: :btree
  end

  add_foreign_key "volunteers", "users"
  add_foreign_key "volunteers", "users", column: "volunteer_id"
end
