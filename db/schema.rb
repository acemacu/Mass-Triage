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

ActiveRecord::Schema.define(:version => 20111208034010) do

  create_table "ambulances", :force => true do |t|
    t.string   "idAmbulance"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "incident_id"
    t.string   "status"
    t.integer  "hospital_id",    :default => 1
    t.integer  "patient_id"
    t.datetime "eta"
    t.integer  "adding_user_id"
    t.boolean  "is_deleted"
  end

  create_table "hospitals", :force => true do |t|
    t.integer  "idHospital"
    t.string   "name"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incident_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "incidents", :force => true do |t|
    t.integer  "idIncident"
    t.datetime "date"
    t.string   "location"
    t.float    "longitude"
    t.float    "latitude"
    t.datetime "dispatchTime"
    t.datetime "arrivalTime"
    t.datetime "endTime"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "est_patient_count",   :default => 0
    t.integer  "requested_amb_count", :default => 0
    t.integer  "incident_type_id"
    t.boolean  "status",              :default => true
    t.integer  "creating_user_id"
    t.integer  "closing_user_id"
    t.string   "description"
  end

  create_table "incidents_users", :id => false, :force => true do |t|
    t.integer  "incident_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patient_updates", :force => true do |t|
    t.integer  "incident_id"
    t.integer  "patient_id"
    t.string   "previous"
    t.string   "updated"
    t.string   "value"
    t.datetime "updateTime"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "patients", :force => true do |t|
    t.string   "numberOfTag"
    t.integer  "idIncident"
    t.string   "tagColor"
    t.string   "sex"
    t.integer  "age"
    t.string   "ageType"
    t.text     "complaint"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "incident_id"
    t.integer  "ambulance_id"
    t.integer  "hospital_id"
    t.integer  "creating_user_id"
    t.boolean  "is_deleted"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "fname"
    t.string   "lname"
  end

end
