# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_05_20_014348) do
  create_table "client_providers", force: :cascade do |t|
    t.integer "client_id", null: false
    t.integer "provider_id", null: false
    t.string "plan", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id", "provider_id"], name: "index_client_providers_on_client_id_and_provider_id", unique: true
    t.index ["client_id"], name: "index_client_providers_on_client_id"
    t.index ["provider_id"], name: "index_client_providers_on_provider_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_clients_on_email", unique: true
  end

  create_table "journal_entries", force: :cascade do |t|
    t.integer "client_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_journal_entries_on_client_id"
    t.index ["created_at"], name: "index_journal_entries_on_created_at"
  end

  create_table "providers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_providers_on_email", unique: true
  end

  add_foreign_key "client_providers", "clients"
  add_foreign_key "client_providers", "providers"
  add_foreign_key "journal_entries", "clients"
end
