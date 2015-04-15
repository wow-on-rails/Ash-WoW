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

ActiveRecord::Schema.define(version: 20150413174351) do

  create_table "account", force: :cascade do |t|
    t.string   "username",        limit: 32,  default: "",          null: false
    t.string   "sha_pass_hash",   limit: 40,  default: "",          null: false
    t.string   "sessionkey",      limit: 80,  default: "",          null: false
    t.string   "v",               limit: 64,  default: "",          null: false
    t.string   "s",               limit: 64,  default: "",          null: false
    t.string   "token_key",       limit: 100, default: "",          null: false
    t.string   "email",           limit: 255, default: "",          null: false
    t.string   "reg_mail",        limit: 255, default: "",          null: false
    t.datetime "joindate",                                          null: false
    t.string   "last_ip",         limit: 15,  default: "127.0.0.1", null: false
    t.string   "last_attempt_ip", limit: 15,  default: "127.0.0.1", null: false
    t.integer  "failed_logins",   limit: 4,   default: 0,           null: false
    t.integer  "locked",          limit: 1,   default: 0,           null: false
    t.string   "lock_country",    limit: 2,   default: "00",        null: false
    t.datetime "last_login",                                        null: false
    t.integer  "online",          limit: 1,   default: 0,           null: false
    t.integer  "expansion",       limit: 1,   default: 2,           null: false
    t.integer  "mutetime",        limit: 8,   default: 0,           null: false
    t.string   "mutereason",      limit: 255, default: "",          null: false
    t.string   "muteby",          limit: 50,  default: "",          null: false
    t.integer  "locale",          limit: 1,   default: 0,           null: false
    t.string   "os",              limit: 3,   default: "",          null: false
    t.integer  "recruiter",       limit: 4,   default: 0,           null: false
  end

  add_index "account", ["username"], name: "idx_username", unique: true, using: :btree

  create_table "account_access", id: false, force: :cascade do |t|
    t.integer "id",      limit: 4,              null: false
    t.integer "gmlevel", limit: 1,              null: false
    t.integer "RealmID", limit: 4, default: -1, null: false
  end

  create_table "account_banned", id: false, force: :cascade do |t|
    t.integer "id",        limit: 4,   default: 0, null: false
    t.integer "bandate",   limit: 4,   default: 0, null: false
    t.integer "unbandate", limit: 4,   default: 0, null: false
    t.string  "bannedby",  limit: 50,              null: false
    t.string  "banreason", limit: 255,             null: false
    t.integer "active",    limit: 1,   default: 1, null: false
  end

  create_table "account_muted", id: false, force: :cascade do |t|
    t.integer "guid",       limit: 4,   default: 0, null: false
    t.integer "mutedate",   limit: 4,   default: 0, null: false
    t.integer "mutetime",   limit: 4,   default: 0, null: false
    t.string  "mutedby",    limit: 50,              null: false
    t.string  "mutereason", limit: 255,             null: false
  end

  create_table "autobroadcast", id: false, force: :cascade do |t|
    t.integer "realmid", limit: 4,          default: -1, null: false
    t.integer "id",      limit: 1,                       null: false
    t.integer "weight",  limit: 1,          default: 1
    t.text    "text",    limit: 4294967295,              null: false
  end

  create_table "ip2nation", id: false, force: :cascade do |t|
    t.integer "ip",      limit: 4, default: 0,  null: false
    t.string  "country", limit: 2, default: "", null: false
  end

  add_index "ip2nation", ["ip"], name: "ip", using: :btree

  create_table "ip2nationCountries", primary_key: "code", force: :cascade do |t|
    t.string "iso_code_2",  limit: 2,   default: "",  null: false
    t.string "iso_code_3",  limit: 3,   default: ""
    t.string "iso_country", limit: 255, default: "",  null: false
    t.string "country",     limit: 255, default: "",  null: false
    t.float  "lat",         limit: 24,  default: 0.0, null: false
    t.float  "lon",         limit: 24,  default: 0.0, null: false
  end

  add_index "ip2nationCountries", ["code"], name: "code", using: :btree

  create_table "ip_banned", id: false, force: :cascade do |t|
    t.string  "ip",        limit: 15,  default: "127.0.0.1", null: false
    t.integer "bandate",   limit: 4,                         null: false
    t.integer "unbandate", limit: 4,                         null: false
    t.string  "bannedby",  limit: 50,  default: "[Console]", null: false
    t.string  "banreason", limit: 255, default: "no reason", null: false
  end

  create_table "logs", id: false, force: :cascade do |t|
    t.integer "time",   limit: 4,                 null: false
    t.integer "realm",  limit: 4,                 null: false
    t.string  "type",   limit: 250,               null: false
    t.integer "level",  limit: 1,     default: 0, null: false
    t.text    "string", limit: 65535
  end

  create_table "logs_ip_actions", force: :cascade do |t|
    t.integer  "account_id",     limit: 4,                           null: false
    t.integer  "character_guid", limit: 4,                           null: false
    t.integer  "type",           limit: 1,                           null: false
    t.string   "ip",             limit: 15,    default: "127.0.0.1", null: false
    t.text     "systemnote",     limit: 65535
    t.integer  "unixtime",       limit: 4,                           null: false
    t.datetime "time",                                               null: false
    t.text     "comment",        limit: 65535
  end

  create_table "news", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "owner",      limit: 4
  end

  create_table "rbac_account_permissions", id: false, force: :cascade do |t|
    t.integer "accountId",    limit: 4,                null: false
    t.integer "permissionId", limit: 4,                null: false
    t.boolean "granted",      limit: 1, default: true, null: false
    t.integer "realmId",      limit: 4, default: -1,   null: false
  end

  add_index "rbac_account_permissions", ["permissionId"], name: "fk__rbac_account_roles__rbac_permissions", using: :btree

  create_table "rbac_default_permissions", id: false, force: :cascade do |t|
    t.integer "secId",        limit: 4,              null: false
    t.integer "permissionId", limit: 4,              null: false
    t.integer "realmId",      limit: 4, default: -1, null: false
  end

  add_index "rbac_default_permissions", ["permissionId"], name: "fk__rbac_default_permissions__rbac_permissions", using: :btree

  create_table "rbac_linked_permissions", id: false, force: :cascade do |t|
    t.integer "id",       limit: 4, null: false
    t.integer "linkedId", limit: 4, null: false
  end

  add_index "rbac_linked_permissions", ["id"], name: "fk__rbac_linked_permissions__rbac_permissions1", using: :btree
  add_index "rbac_linked_permissions", ["linkedId"], name: "fk__rbac_linked_permissions__rbac_permissions2", using: :btree

  create_table "rbac_permissions", force: :cascade do |t|
    t.string "name", limit: 100, null: false
  end

  create_table "realmcharacters", id: false, force: :cascade do |t|
    t.integer "realmid",  limit: 4, default: 0, null: false
    t.integer "acctid",   limit: 4,             null: false
    t.integer "numchars", limit: 1, default: 0, null: false
  end

  add_index "realmcharacters", ["acctid"], name: "acctid", using: :btree

  create_table "realmlist", force: :cascade do |t|
    t.string  "name",                 limit: 32,  default: "",              null: false
    t.string  "address",              limit: 255, default: "127.0.0.1",     null: false
    t.string  "localAddress",         limit: 255, default: "127.0.0.1",     null: false
    t.string  "localSubnetMask",      limit: 255, default: "255.255.255.0", null: false
    t.integer "port",                 limit: 2,   default: 8085,            null: false
    t.integer "icon",                 limit: 1,   default: 0,               null: false
    t.integer "flag",                 limit: 1,   default: 2,               null: false
    t.integer "timezone",             limit: 1,   default: 0,               null: false
    t.integer "allowedSecurityLevel", limit: 1,   default: 0,               null: false
    t.float   "population",           limit: 24,  default: 0.0,             null: false
    t.integer "gamebuild",            limit: 4,   default: 12340,           null: false
  end

  add_index "realmlist", ["name"], name: "idx_name", unique: true, using: :btree

  create_table "settings", force: :cascade do |t|
    t.string   "var",        limit: 255,   null: false
    t.text     "value",      limit: 65535
    t.integer  "thing_id",   limit: 4
    t.string   "thing_type", limit: 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true, using: :btree

  create_table "updates", primary_key: "name", force: :cascade do |t|
    t.string   "hash",      limit: 40, default: ""
    t.string   "state",     limit: 8,  default: "RELEASED", null: false
    t.datetime "timestamp",                                 null: false
    t.integer  "speed",     limit: 4,  default: 0,          null: false
  end

  create_table "updates_include", primary_key: "path", force: :cascade do |t|
    t.string "state", limit: 8, default: "RELEASED", null: false
  end

  create_table "uptime", id: false, force: :cascade do |t|
    t.integer "realmid",    limit: 4,                           null: false
    t.integer "starttime",  limit: 4,   default: 0,             null: false
    t.integer "uptime",     limit: 4,   default: 0,             null: false
    t.integer "maxplayers", limit: 2,   default: 0,             null: false
    t.string  "revision",   limit: 255, default: "Trinitycore", null: false
  end

  add_foreign_key "rbac_account_permissions", "account", column: "accountId", name: "fk__rbac_account_permissions__account", on_delete: :cascade
  add_foreign_key "rbac_account_permissions", "rbac_permissions", column: "permissionId", name: "fk__rbac_account_roles__rbac_permissions", on_delete: :cascade
  add_foreign_key "rbac_default_permissions", "rbac_permissions", column: "permissionId", name: "fk__rbac_default_permissions__rbac_permissions"
  add_foreign_key "rbac_linked_permissions", "rbac_permissions", column: "id", name: "fk__rbac_linked_permissions__rbac_permissions1", on_delete: :cascade
  add_foreign_key "rbac_linked_permissions", "rbac_permissions", column: "linkedId", name: "fk__rbac_linked_permissions__rbac_permissions2", on_delete: :cascade
end
