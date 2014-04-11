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

ActiveRecord::Schema.define(version: 20140403085353) do

  create_table "addresses", force: true do |t|
    t.string   "addressable_type"
    t.integer  "addressable_id"
    t.string   "line_1"
    t.string   "line_2"
    t.string   "landmark"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.string   "mobile"
    t.string   "phone_1"
    t.string   "phone_2"
    t.string   "email_1"
    t.string   "email_2"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "contact"
    t.text     "notes"
    t.boolean  "active",      default: true
    t.boolean  "archived",    default: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.string   "remote_photo_url"
  end

  create_table "departments", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.string   "kind"
    t.integer  "manager_id"
    t.text     "notes"
    t.boolean  "active",      default: true
    t.boolean  "archived",    default: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "divisions", force: true do |t|
    t.integer  "parent_id"
    t.string   "code"
    t.string   "name"
    t.text     "notes"
    t.boolean  "active",      default: true
    t.boolean  "archived",    default: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", force: true do |t|
    t.integer  "department_id"
    t.string   "code"
    t.string   "name"
    t.string   "designation"
    t.date     "join_date"
    t.integer  "user_id"
    t.integer  "manager_id"
    t.string   "status"
    t.boolean  "active"
    t.text     "notes"
    t.boolean  "active",      default: true
    t.boolean  "archived",    default: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  add_index "employees", ["department_id"], name: "index_employees_on_department_id"
  add_index "employees", ["user_id"], name: "index_employees_on_user_id"

  create_table "pipelines", force: true do |t|
    t.integer  "project_id"
    t.integer  "division_id"
    t.integer  "employee_id"
    t.date     "reserved_date"
    t.string   "status"
    t.text     "notes"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pipelines", ["division_id"], name: "index_pipelines_on_division_id"
  add_index "pipelines", ["employee_id"], name: "index_pipelines_on_employee_id"
  add_index "pipelines", ["project_id"], name: "index_pipelines_on_project_id"

  create_table "projects", force: true do |t|
    t.integer  "division_id"
    t.integer  "client_id"
    t.string   "code"
    t.string   "name"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "manager_id"
    t.text     "notes"
    t.boolean  "active",      default: true
    t.boolean  "archived",    default: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id"
  add_index "projects", ["division_id"], name: "index_projects_on_division_id"

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "timesheets", force: true do |t|
    t.integer  "project_id"
    t.integer  "division_id"
    t.integer  "employee_id"
    t.date     "entry_date"
    t.string   "entry_period"
    t.string   "status"
    t.string   "activity"
    t.decimal  "hours"
    t.text     "notes"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "timesheets", ["division_id"], name: "index_timesheets_on_division_id"
  add_index "timesheets", ["employee_id"], name: "index_timesheets_on_employee_id"
  add_index "timesheets", ["project_id"], name: "index_timesheets_on_project_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.text     "notes"
    t.boolean  "active",      default: true
    t.boolean  "archived",    default: false
    t.integer  "created_by"
    t.integer  "updated_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
