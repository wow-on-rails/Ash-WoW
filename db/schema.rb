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

ActiveRecord::Schema.define(version: 0) do

  create_table "account_data", id: false, force: :cascade do |t|
    t.integer "accountId", limit: 4,     default: 0, null: false
    t.integer "type",      limit: 1,     default: 0, null: false
    t.integer "time",      limit: 4,     default: 0, null: false
    t.binary  "data",      limit: 65535,             null: false
  end

  create_table "account_instance_times", id: false, force: :cascade do |t|
    t.integer "accountId",   limit: 4,             null: false
    t.integer "instanceId",  limit: 4, default: 0, null: false
    t.integer "releaseTime", limit: 8, default: 0, null: false
  end

  create_table "account_tutorial", primary_key: "accountId", force: :cascade do |t|
    t.integer "tut0", limit: 4, default: 0, null: false
    t.integer "tut1", limit: 4, default: 0, null: false
    t.integer "tut2", limit: 4, default: 0, null: false
    t.integer "tut3", limit: 4, default: 0, null: false
    t.integer "tut4", limit: 4, default: 0, null: false
    t.integer "tut5", limit: 4, default: 0, null: false
    t.integer "tut6", limit: 4, default: 0, null: false
    t.integer "tut7", limit: 4, default: 0, null: false
  end

  create_table "addons", primary_key: "name", force: :cascade do |t|
    t.integer "crc", limit: 4, default: 0, null: false
  end

  create_table "arena_team", primary_key: "arenaTeamId", force: :cascade do |t|
    t.string  "name",            limit: 24,             null: false
    t.integer "captainGuid",     limit: 4,  default: 0, null: false
    t.integer "type",            limit: 1,  default: 0, null: false
    t.integer "rating",          limit: 2,  default: 0, null: false
    t.integer "seasonGames",     limit: 2,  default: 0, null: false
    t.integer "seasonWins",      limit: 2,  default: 0, null: false
    t.integer "weekGames",       limit: 2,  default: 0, null: false
    t.integer "weekWins",        limit: 2,  default: 0, null: false
    t.integer "rank",            limit: 4,  default: 0, null: false
    t.integer "backgroundColor", limit: 4,  default: 0, null: false
    t.integer "emblemStyle",     limit: 1,  default: 0, null: false
    t.integer "emblemColor",     limit: 4,  default: 0, null: false
    t.integer "borderStyle",     limit: 1,  default: 0, null: false
    t.integer "borderColor",     limit: 4,  default: 0, null: false
  end

  create_table "arena_team_member", id: false, force: :cascade do |t|
    t.integer "arenaTeamId",    limit: 4, default: 0, null: false
    t.integer "guid",           limit: 4, default: 0, null: false
    t.integer "weekGames",      limit: 2, default: 0, null: false
    t.integer "weekWins",       limit: 2, default: 0, null: false
    t.integer "seasonGames",    limit: 2, default: 0, null: false
    t.integer "seasonWins",     limit: 2, default: 0, null: false
    t.integer "personalRating", limit: 2, default: 0, null: false
  end

  create_table "auctionhouse", force: :cascade do |t|
    t.integer "auctioneerguid", limit: 4, default: 0, null: false
    t.integer "itemguid",       limit: 4, default: 0, null: false
    t.integer "itemowner",      limit: 4, default: 0, null: false
    t.integer "buyoutprice",    limit: 4, default: 0, null: false
    t.integer "time",           limit: 4, default: 0, null: false
    t.integer "buyguid",        limit: 4, default: 0, null: false
    t.integer "lastbid",        limit: 4, default: 0, null: false
    t.integer "startbid",       limit: 4, default: 0, null: false
    t.integer "deposit",        limit: 4, default: 0, null: false
  end

  ##add_index "auctionhouse", ["itemguid"], name: "item_guid", unique: true, using: :btree

  create_table "banned_addons", primary_key: "Id", force: :cascade do |t|
    t.string   "Name",      limit: 255,              null: false
    t.string   "Version",   limit: 255, default: "", null: false
    t.datetime "Timestamp",                          null: false
  end

  ##add_index "banned_addons", ["Name", "Version"], name: "idx_name_ver", unique: true, using: :btree

  create_table "bugreport", force: :cascade do |t|
    t.text "type",    limit: 1073741823, null: false
    t.text "content", limit: 1073741823, null: false
  end

  create_table "calendar_events", force: :cascade do |t|
    t.integer "creator",     limit: 4,   default: 0,     null: false
    t.string  "title",       limit: 255, default: "",    null: false
    t.string  "description", limit: 255, default: "",    null: false
    t.boolean "type",        default: false, null: false
    t.integer "dungeon",     limit: 4,   default: -1,    null: false
    t.integer "eventtime",   limit: 4,   default: 0,     null: false
    t.integer "flags",       limit: 4,   default: 0,     null: false
    t.integer "time2",       limit: 4,   default: 0,     null: false
  end

  create_table "calendar_invites", force: :cascade do |t|
    t.integer "event",      limit: 8,   default: 0,     null: false
    t.integer "invitee",    limit: 4,   default: 0,     null: false
    t.integer "sender",     limit: 4,   default: 0,     null: false
    t.boolean "status",     default: false, null: false
    t.integer "statustime", default: 0,     null: false
    t.boolean "rank",       default: false, null: false
    t.string  "text",       limit: 255, default: "",    null: false
  end

  create_table "channels", id: false, force: :cascade do |t|
    t.string  "name",       limit: 128,               null: false
    t.integer "team",       limit: 4,                 null: false
    t.integer "announce",   limit: 1,     default: 1, null: false
    t.integer "ownership",  limit: 1,     default: 1, null: false
    t.string  "password",   limit: 32
    t.text    "bannedList", limit: 65535
    t.integer "lastUsed",   limit: 4,                 null: false
  end

  create_table "character_account_data", id: false, force: :cascade do |t|
    t.integer "guid", limit: 4,     default: 0, null: false
    t.integer "type", limit: 1,     default: 0, null: false
    t.integer "time", limit: 4,     default: 0, null: false
    t.binary  "data", limit: 65535,             null: false
  end

  create_table "character_achievement", id: false, force: :cascade do |t|
    t.integer "guid",        limit: 4,             null: false
    t.integer "achievement", limit: 2,             null: false
    t.integer "date",        limit: 4, default: 0, null: false
  end

  create_table "character_achievement_progress", id: false, force: :cascade do |t|
    t.integer "guid",     limit: 4,             null: false
    t.integer "criteria", limit: 2,             null: false
    t.integer "counter",  limit: 4,             null: false
    t.integer "date",     limit: 4, default: 0, null: false
  end

  create_table "character_action", id: false, force: :cascade do |t|
    t.integer "guid",   limit: 4, default: 0, null: false
    t.integer "spec",   limit: 1, default: 0, null: false
    t.integer "button", limit: 1, default: 0, null: false
    t.integer "action", limit: 4, default: 0, null: false
    t.integer "type",   limit: 1, default: 0, null: false
  end

  create_table "character_arena_stats", id: false, force: :cascade do |t|
    t.integer "guid",             limit: 4, null: false
    t.integer "slot",             limit: 1, null: false
    t.integer "matchMakerRating", limit: 2, null: false
  end

  create_table "character_aura", id: false, force: :cascade do |t|
    t.integer "guid",             limit: 4, default: 0, null: false
    t.integer "caster_guid",      limit: 8, default: 0, null: false
    t.integer "item_guid",        limit: 8, default: 0, null: false
    t.integer "spell",            limit: 3, default: 0, null: false
    t.integer "effect_mask",      limit: 1, default: 0, null: false
    t.integer "recalculate_mask", limit: 1, default: 0, null: false
    t.integer "stackcount",       limit: 1, default: 1, null: false
    t.integer "amount0",          limit: 4, default: 0, null: false
    t.integer "amount1",          limit: 4, default: 0, null: false
    t.integer "amount2",          limit: 4, default: 0, null: false
    t.integer "base_amount0",     limit: 4, default: 0, null: false
    t.integer "base_amount1",     limit: 4, default: 0, null: false
    t.integer "base_amount2",     limit: 4, default: 0, null: false
    t.integer "maxduration",      limit: 4, default: 0, null: false
    t.integer "remaintime",       limit: 4, default: 0, null: false
    t.integer "remaincharges",    limit: 1, default: 0, null: false
  end

  create_table "character_banned", id: false, force: :cascade do |t|
    t.integer "guid",      limit: 4,   default: 0, null: false
    t.integer "bandate",   limit: 4,   default: 0, null: false
    t.integer "unbandate", limit: 4,   default: 0, null: false
    t.string  "bannedby",  limit: 50,              null: false
    t.string  "banreason", limit: 255,             null: false
    t.integer "active",    limit: 1,   default: 1, null: false
  end

  create_table "character_battleground_data", primary_key: "guid", force: :cascade do |t|
    t.integer "instanceId", limit: 4,                null: false
    t.integer "team",       limit: 2,                null: false
    t.float   "joinX",      limit: 24, default: 0.0, null: false
    t.float   "joinY",      limit: 24, default: 0.0, null: false
    t.float   "joinZ",      limit: 24, default: 0.0, null: false
    t.float   "joinO",      limit: 24, default: 0.0, null: false
    t.integer "joinMapId",  limit: 2,  default: 0,   null: false
    t.integer "taxiStart",  limit: 4,  default: 0,   null: false
    t.integer "taxiEnd",    limit: 4,  default: 0,   null: false
    t.integer "mountSpell", limit: 3,  default: 0,   null: false
  end

  create_table "character_battleground_random", primary_key: "guid", force: :cascade do |t|
  end

  create_table "character_declinedname", primary_key: "guid", force: :cascade do |t|
    t.string "genitive",      limit: 15, default: "", null: false
    t.string "dative",        limit: 15, default: "", null: false
    t.string "accusative",    limit: 15, default: "", null: false
    t.string "instrumental",  limit: 15, default: "", null: false
    t.string "prepositional", limit: 15, default: "", null: false
  end

  create_table "character_equipmentsets", primary_key: "setguid", force: :cascade do |t|
    t.integer "guid",        limit: 4,   default: 0, null: false
    t.integer "setindex",    limit: 1,   default: 0, null: false
    t.string  "name",        limit: 31,              null: false
    t.string  "iconname",    limit: 100,             null: false
    t.integer "ignore_mask", limit: 4,   default: 0, null: false
    t.integer "item0",       limit: 4,   default: 0, null: false
    t.integer "item1",       limit: 4,   default: 0, null: false
    t.integer "item2",       limit: 4,   default: 0, null: false
    t.integer "item3",       limit: 4,   default: 0, null: false
    t.integer "item4",       limit: 4,   default: 0, null: false
    t.integer "item5",       limit: 4,   default: 0, null: false
    t.integer "item6",       limit: 4,   default: 0, null: false
    t.integer "item7",       limit: 4,   default: 0, null: false
    t.integer "item8",       limit: 4,   default: 0, null: false
    t.integer "item9",       limit: 4,   default: 0, null: false
    t.integer "item10",      limit: 4,   default: 0, null: false
    t.integer "item11",      limit: 4,   default: 0, null: false
    t.integer "item12",      limit: 4,   default: 0, null: false
    t.integer "item13",      limit: 4,   default: 0, null: false
    t.integer "item14",      limit: 4,   default: 0, null: false
    t.integer "item15",      limit: 4,   default: 0, null: false
    t.integer "item16",      limit: 4,   default: 0, null: false
    t.integer "item17",      limit: 4,   default: 0, null: false
    t.integer "item18",      limit: 4,   default: 0, null: false
  end

  ##add_index "character_equipmentsets", ["guid", "setguid", "setindex"], name: "idx_set", unique: true, using: :btree
  ##add_index "character_equipmentsets", ["setindex"], name: "Idx_setindex", using: :btree

  create_table "character_gifts", primary_key: "item_guid", force: :cascade do |t|
    t.integer "guid",  limit: 4, default: 0, null: false
    t.integer "entry", limit: 4, default: 0, null: false
    t.integer "flags", limit: 4, default: 0, null: false
  end

  ##add_index "character_gifts", ["guid"], name: "idx_guid", using: :btree

  create_table "character_glyphs", id: false, force: :cascade do |t|
    t.integer "guid",   limit: 4,             null: false
    t.integer "spec",   limit: 1, default: 0, null: false
    t.integer "glyph1", limit: 2, default: 0
    t.integer "glyph2", limit: 2, default: 0
    t.integer "glyph3", limit: 2, default: 0
    t.integer "glyph4", limit: 2, default: 0
    t.integer "glyph5", limit: 2, default: 0
    t.integer "glyph6", limit: 2, default: 0
  end

  create_table "character_homebind", primary_key: "guid", force: :cascade do |t|
    t.integer "mapId",  limit: 2,  default: 0,   null: false
    t.integer "zoneId", limit: 2,  default: 0,   null: false
    t.float   "posX",   limit: 24, default: 0.0, null: false
    t.float   "posY",   limit: 24, default: 0.0, null: false
    t.float   "posZ",   limit: 24, default: 0.0, null: false
  end

  create_table "character_instance", id: false, force: :cascade do |t|
    t.integer "guid",      limit: 4, default: 0, null: false
    t.integer "instance",  limit: 4, default: 0, null: false
    t.integer "permanent", limit: 1, default: 0, null: false
  end

  ##add_index "character_instance", ["instance"], name: "instance", using: :btree

  create_table "character_inventory", primary_key: "item", force: :cascade do |t|
    t.integer "guid", limit: 4, default: 0, null: false
    t.integer "bag",  limit: 4, default: 0, null: false
    t.integer "slot", limit: 1, default: 0, null: false
  end

  #add_index "character_inventory", ["guid", "bag", "slot"], name: "guid", unique: true, using: :btree
  ##add_index "character_inventory", ["guid"], name: "idx_guid", using: :btree

  create_table "character_pet", force: :cascade do |t|
    t.integer "entry",          limit: 4,     default: 0,     null: false
    t.integer "owner",          limit: 4,     default: 0,     null: false
    t.integer "modelid",        limit: 4,     default: 0
    t.integer "CreatedBySpell", limit: 3,     default: 0,     null: false
    t.integer "PetType",        limit: 1,     default: 0,     null: false
    t.integer "level",          limit: 2,     default: 1,     null: false
    t.integer "exp",            limit: 4,     default: 0,     null: false
    t.integer "Reactstate",     limit: 1,     default: 0,     null: false
    t.string  "name",           limit: 21,    default: "Pet", null: false
    t.integer "renamed",        limit: 1,     default: 0,     null: false
    t.integer "slot",           limit: 1,     default: 0,     null: false
    t.integer "curhealth",      limit: 4,     default: 1,     null: false
    t.integer "curmana",        limit: 4,     default: 0,     null: false
    t.integer "curhappiness",   limit: 4,     default: 0,     null: false
    t.integer "savetime",       limit: 4,     default: 0,     null: false
    t.text    "abdata",         limit: 65535
  end

  #add_index "character_pet", ["owner"], name: "owner", using: :btree
  #add_index "character_pet", ["slot"], name: "idx_slot", using: :btree

  create_table "character_pet_declinedname", force: :cascade do |t|
    t.integer "owner",         limit: 4,  default: 0,  null: false
    t.string  "genitive",      limit: 12, default: "", null: false
    t.string  "dative",        limit: 12, default: "", null: false
    t.string  "accusative",    limit: 12, default: "", null: false
    t.string  "instrumental",  limit: 12, default: "", null: false
    t.string  "prepositional", limit: 12, default: "", null: false
  end

  #add_index "character_pet_declinedname", ["owner"], name: "owner_key", using: :btree

  create_table "character_queststatus", id: false, force: :cascade do |t|
    t.integer "guid",        limit: 4, default: 0, null: false
    t.integer "quest",       limit: 4, default: 0, null: false
    t.integer "status",      limit: 1, default: 0, null: false
    t.integer "explored",    limit: 1, default: 0, null: false
    t.integer "timer",       limit: 4, default: 0, null: false
    t.integer "mobcount1",   limit: 2, default: 0, null: false
    t.integer "mobcount2",   limit: 2, default: 0, null: false
    t.integer "mobcount3",   limit: 2, default: 0, null: false
    t.integer "mobcount4",   limit: 2, default: 0, null: false
    t.integer "itemcount1",  limit: 2, default: 0, null: false
    t.integer "itemcount2",  limit: 2, default: 0, null: false
    t.integer "itemcount3",  limit: 2, default: 0, null: false
    t.integer "itemcount4",  limit: 2, default: 0, null: false
    t.integer "playercount", limit: 2, default: 0, null: false
  end

  create_table "character_queststatus_daily", id: false, force: :cascade do |t|
    t.integer "guid",  limit: 4, default: 0, null: false
    t.integer "quest", limit: 4, default: 0, null: false
    t.integer "time",  limit: 4, default: 0, null: false
  end

  ##add_index "character_queststatus_daily", ["guid"], name: "idx_guid", using: :btree

  create_table "character_queststatus_monthly", id: false, force: :cascade do |t|
    t.integer "guid",  limit: 4, default: 0, null: false
    t.integer "quest", limit: 4, default: 0, null: false
  end

  #add_index "character_queststatus_monthly", ["guid"], name: "idx_guid", using: :btree

  create_table "character_queststatus_rewarded", id: false, force: :cascade do |t|
    t.integer "guid",   limit: 4, default: 0, null: false
    t.integer "quest",  limit: 4, default: 0, null: false
    t.integer "active", limit: 1, default: 1, null: false
  end

  create_table "character_queststatus_seasonal", id: false, force: :cascade do |t|
    t.integer "guid",  limit: 4, default: 0, null: false
    t.integer "quest", limit: 4, default: 0, null: false
    t.integer "event", limit: 4, default: 0, null: false
  end

  ##add_index "character_queststatus_seasonal", ["guid"], name: "idx_guid", using: :btree

  create_table "character_queststatus_weekly", id: false, force: :cascade do |t|
    t.integer "guid",  limit: 4, default: 0, null: false
    t.integer "quest", limit: 4, default: 0, null: false
  end

  ##add_index "character_queststatus_weekly", ["guid"], name: "idx_guid", using: :btree

  create_table "character_reputation", id: false, force: :cascade do |t|
    t.integer "guid",     limit: 4, default: 0, null: false
    t.integer "faction",  limit: 2, default: 0, null: false
    t.integer "standing", limit: 4, default: 0, null: false
    t.integer "flags",    limit: 2, default: 0, null: false
  end

  create_table "character_skills", id: false, force: :cascade do |t|
    t.integer "guid",  limit: 4, null: false
    t.integer "skill", limit: 2, null: false
    t.integer "value", limit: 2, null: false
    t.integer "max",   limit: 2, null: false
  end

  create_table "character_social", id: false, force: :cascade do |t|
    t.integer "guid",   limit: 4,  default: 0,  null: false
    t.integer "friend", limit: 4,  default: 0,  null: false
    t.integer "flags",  limit: 1,  default: 0,  null: false
    t.string  "note",   limit: 48, default: "", null: false
  end

  #add_index "character_social", ["friend"], name: "friend", using: :btree

  create_table "character_spell", id: false, force: :cascade do |t|
    t.integer "guid",     limit: 4, default: 0, null: false
    t.integer "spell",    limit: 3, default: 0, null: false
    t.integer "active",   limit: 1, default: 1, null: false
    t.integer "disabled", limit: 1, default: 0, null: false
  end

  create_table "character_spell_cooldown", id: false, force: :cascade do |t|
    t.integer "guid",  limit: 4, default: 0, null: false
    t.integer "spell", limit: 3, default: 0, null: false
    t.integer "item",  limit: 4, default: 0, null: false
    t.integer "time",  limit: 4, default: 0, null: false
  end

  create_table "character_stats", primary_key: "guid", force: :cascade do |t|
    t.integer "maxhealth",         limit: 4,  default: 0,   null: false
    t.integer "maxpower1",         limit: 4,  default: 0,   null: false
    t.integer "maxpower2",         limit: 4,  default: 0,   null: false
    t.integer "maxpower3",         limit: 4,  default: 0,   null: false
    t.integer "maxpower4",         limit: 4,  default: 0,   null: false
    t.integer "maxpower5",         limit: 4,  default: 0,   null: false
    t.integer "maxpower6",         limit: 4,  default: 0,   null: false
    t.integer "maxpower7",         limit: 4,  default: 0,   null: false
    t.integer "strength",          limit: 4,  default: 0,   null: false
    t.integer "agility",           limit: 4,  default: 0,   null: false
    t.integer "stamina",           limit: 4,  default: 0,   null: false
    t.integer "intellect",         limit: 4,  default: 0,   null: false
    t.integer "spirit",            limit: 4,  default: 0,   null: false
    t.integer "armor",             limit: 4,  default: 0,   null: false
    t.integer "resHoly",           limit: 4,  default: 0,   null: false
    t.integer "resFire",           limit: 4,  default: 0,   null: false
    t.integer "resNature",         limit: 4,  default: 0,   null: false
    t.integer "resFrost",          limit: 4,  default: 0,   null: false
    t.integer "resShadow",         limit: 4,  default: 0,   null: false
    t.integer "resArcane",         limit: 4,  default: 0,   null: false
    t.float   "blockPct",          limit: 24, default: 0.0, null: false
    t.float   "dodgePct",          limit: 24, default: 0.0, null: false
    t.float   "parryPct",          limit: 24, default: 0.0, null: false
    t.float   "critPct",           limit: 24, default: 0.0, null: false
    t.float   "rangedCritPct",     limit: 24, default: 0.0, null: false
    t.float   "spellCritPct",      limit: 24, default: 0.0, null: false
    t.integer "attackPower",       limit: 4,  default: 0,   null: false
    t.integer "rangedAttackPower", limit: 4,  default: 0,   null: false
    t.integer "spellPower",        limit: 4,  default: 0,   null: false
    t.integer "resilience",        limit: 4,  default: 0,   null: false
  end

  create_table "character_talent", id: false, force: :cascade do |t|
    t.integer "guid",  limit: 4,             null: false
    t.integer "spell", limit: 3,             null: false
    t.integer "spec",  limit: 1, default: 0, null: false
  end

  create_table "characters", primary_key: "guid", force: :cascade do |t|
    t.integer "account",              limit: 4,          default: 0,   null: false
    t.string  "name",                 limit: 12,                       null: false
    t.integer "race",                 limit: 1,          default: 0,   null: false
    t.integer "class",                limit: 1,          default: 0,   null: false
    t.integer "gender",               limit: 1,          default: 0,   null: false
    t.integer "level",                limit: 1,          default: 0,   null: false
    t.integer "xp",                   limit: 4,          default: 0,   null: false
    t.integer "money",                limit: 4,          default: 0,   null: false
    t.integer "playerBytes",          limit: 4,          default: 0,   null: false
    t.integer "playerBytes2",         limit: 4,          default: 0,   null: false
    t.integer "playerFlags",          limit: 4,          default: 0,   null: false
    t.float   "position_x",           limit: 24,         default: 0.0, null: false
    t.float   "position_y",           limit: 24,         default: 0.0, null: false
    t.float   "position_z",           limit: 24,         default: 0.0, null: false
    t.integer "map",                  limit: 2,          default: 0,   null: false
    t.integer "instance_id",          limit: 4,          default: 0,   null: false
    t.integer "instance_mode_mask",   limit: 1,          default: 0,   null: false
    t.float   "orientation",          limit: 24,         default: 0.0, null: false
    t.text    "taximask",             limit: 65535,                    null: false
    t.integer "online",               limit: 1,          default: 0,   null: false
    t.integer "cinematic",            limit: 1,          default: 0,   null: false
    t.integer "totaltime",            limit: 4,          default: 0,   null: false
    t.integer "leveltime",            limit: 4,          default: 0,   null: false
    t.integer "logout_time",          limit: 4,          default: 0,   null: false
    t.integer "is_logout_resting",    limit: 1,          default: 0,   null: false
    t.float   "rest_bonus",           limit: 24,         default: 0.0, null: false
    t.integer "resettalents_cost",    limit: 4,          default: 0,   null: false
    t.integer "resettalents_time",    limit: 4,          default: 0,   null: false
    t.float   "trans_x",              limit: 24,         default: 0.0, null: false
    t.float   "trans_y",              limit: 24,         default: 0.0, null: false
    t.float   "trans_z",              limit: 24,         default: 0.0, null: false
    t.float   "trans_o",              limit: 24,         default: 0.0, null: false
    t.integer "transguid",            limit: 3,          default: 0,   null: false
    t.integer "extra_flags",          limit: 2,          default: 0,   null: false
    t.integer "stable_slots",         limit: 1,          default: 0,   null: false
    t.integer "at_login",             limit: 2,          default: 0,   null: false
    t.integer "zone",                 limit: 2,          default: 0,   null: false
    t.integer "death_expire_time",    limit: 4,          default: 0,   null: false
    t.text    "taxi_path",            limit: 65535
    t.integer "arenaPoints",          limit: 4,          default: 0,   null: false
    t.integer "totalHonorPoints",     limit: 4,          default: 0,   null: false
    t.integer "todayHonorPoints",     limit: 4,          default: 0,   null: false
    t.integer "yesterdayHonorPoints", limit: 4,          default: 0,   null: false
    t.integer "totalKills",           limit: 4,          default: 0,   null: false
    t.integer "todayKills",           limit: 2,          default: 0,   null: false
    t.integer "yesterdayKills",       limit: 2,          default: 0,   null: false
    t.integer "chosenTitle",          limit: 4,          default: 0,   null: false
    t.integer "knownCurrencies",      limit: 8,          default: 0,   null: false
    t.integer "watchedFaction",       limit: 4,          default: 0,   null: false
    t.integer "drunk",                limit: 1,          default: 0,   null: false
    t.integer "health",               limit: 4,          default: 0,   null: false
    t.integer "power1",               limit: 4,          default: 0,   null: false
    t.integer "power2",               limit: 4,          default: 0,   null: false
    t.integer "power3",               limit: 4,          default: 0,   null: false
    t.integer "power4",               limit: 4,          default: 0,   null: false
    t.integer "power5",               limit: 4,          default: 0,   null: false
    t.integer "power6",               limit: 4,          default: 0,   null: false
    t.integer "power7",               limit: 4,          default: 0,   null: false
    t.integer "latency",              limit: 3,          default: 0,   null: false
    t.integer "speccount",            limit: 1,          default: 1,   null: false
    t.integer "activespec",           limit: 1,          default: 0,   null: false
    t.text    "exploredZones",        limit: 1073741823
    t.text    "equipmentCache",       limit: 1073741823
    t.integer "ammoId",               limit: 4,          default: 0,   null: false
    t.text    "knownTitles",          limit: 1073741823
    t.integer "actionBars",           limit: 1,          default: 0,   null: false
    t.integer "grantableLevels",      limit: 1,          default: 0,   null: false
    t.integer "deleteInfos_Account",  limit: 4
    t.string  "deleteInfos_Name",     limit: 12
    t.integer "deleteDate",           limit: 4
  end

  #add_index "characters", ["account"], name: "idx_account", using: :btree
  ##add_index "characters", ["name"], name: "idx_name", using: :btree
  #add_index "characters", ["online"], name: "idx_online", using: :btree

  create_table "corpse", primary_key: "corpseGuid", force: :cascade do |t|
    t.integer "guid",        limit: 4,     default: 0,   null: false
    t.float   "posX",        limit: 24,    default: 0.0, null: false
    t.float   "posY",        limit: 24,    default: 0.0, null: false
    t.float   "posZ",        limit: 24,    default: 0.0, null: false
    t.float   "orientation", limit: 24,    default: 0.0, null: false
    t.integer "mapId",       limit: 2,     default: 0,   null: false
    t.integer "phaseMask",   limit: 4,     default: 1,   null: false
    t.integer "displayId",   limit: 4,     default: 0,   null: false
    t.text    "itemCache",   limit: 65535,               null: false
    t.integer "bytes1",      limit: 4,     default: 0,   null: false
    t.integer "bytes2",      limit: 4,     default: 0,   null: false
    t.integer "guildId",     limit: 4,     default: 0,   null: false
    t.integer "flags",       limit: 1,     default: 0,   null: false
    t.integer "dynFlags",    limit: 1,     default: 0,   null: false
    t.integer "time",        limit: 4,     default: 0,   null: false
    t.integer "corpseType",  limit: 1,     default: 0,   null: false
    t.integer "instanceId",  limit: 4,     default: 0,   null: false
  end

  #add_index "corpse", ["corpseType"], name: "idx_type", using: :btree
  #add_index "corpse", ["guid"], name: "idx_player", using: :btree
  ##add_index "corpse", ["instanceId"], name: "idx_instance", using: :btree
  #add_index "corpse", ["time"], name: "idx_time", using: :btree

  create_table "creature_respawn", id: false, force: :cascade do |t|
    t.integer "guid",        limit: 4, default: 0, null: false
    t.integer "respawnTime", limit: 4, default: 0, null: false
    t.integer "mapId",       limit: 2, default: 0, null: false
    t.integer "instanceId",  limit: 4, default: 0, null: false
  end

  ##add_index "creature_respawn", ["instanceId"], name: "idx_instance", using: :btree

  create_table "game_event_condition_save", id: false, force: :cascade do |t|
    t.integer "eventEntry",   limit: 1,                null: false
    t.integer "condition_id", limit: 4,  default: 0,   null: false
    t.float   "done",         limit: 24, default: 0.0
  end

  create_table "game_event_save", primary_key: "eventEntry", force: :cascade do |t|
    t.integer "state",      limit: 1, default: 1, null: false
    t.integer "next_start", limit: 4, default: 0, null: false
  end

  create_table "gameobject_respawn", id: false, force: :cascade do |t|
    t.integer "guid",        limit: 4, default: 0, null: false
    t.integer "respawnTime", limit: 4, default: 0, null: false
    t.integer "mapId",       limit: 2, default: 0, null: false
    t.integer "instanceId",  limit: 4, default: 0, null: false
  end

  ##add_index "gameobject_respawn", ["instanceId"], name: "idx_instance", using: :btree

  create_table "gm_subsurveys", id: false, force: :cascade do |t|
    t.integer "surveyId",    limit: 4,                 null: false
    t.integer "subsurveyId", limit: 4,     default: 0, null: false
    t.integer "rank",        limit: 4,     default: 0, null: false
    t.text    "comment",     limit: 65535,             null: false
  end

  create_table "gm_surveys", primary_key: "surveyId", force: :cascade do |t|
    t.integer "guid",           limit: 4,          default: 0, null: false
    t.integer "mainSurvey",     limit: 4,          default: 0, null: false
    t.text    "overallComment", limit: 1073741823,             null: false
    t.integer "createTime",     limit: 4,          default: 0, null: false
  end

  create_table "gm_tickets", primary_key: "ticketId", force: :cascade do |t|
    t.integer "guid",             limit: 4,     default: 0,   null: false
    t.string  "name",             limit: 12,                  null: false
    t.text    "message",          limit: 65535,               null: false
    t.integer "createTime",       limit: 4,     default: 0,   null: false
    t.integer "mapId",            limit: 2,     default: 0,   null: false
    t.float   "posX",             limit: 24,    default: 0.0, null: false
    t.float   "posY",             limit: 24,    default: 0.0, null: false
    t.float   "posZ",             limit: 24,    default: 0.0, null: false
    t.integer "lastModifiedTime", limit: 4,     default: 0,   null: false
    t.integer "closedBy",         limit: 4,     default: 0,   null: false
    t.integer "assignedTo",       limit: 4,     default: 0,   null: false
    t.text    "comment",          limit: 65535,               null: false
    t.text    "response",         limit: 65535,               null: false
    t.integer "completed",        limit: 1,     default: 0,   null: false
    t.integer "escalated",        limit: 1,     default: 0,   null: false
    t.integer "viewed",           limit: 1,     default: 0,   null: false
    t.integer "haveTicket",       limit: 1,     default: 0,   null: false
  end

  create_table "group_instance", id: false, force: :cascade do |t|
    t.integer "guid",      limit: 4, default: 0, null: false
    t.integer "instance",  limit: 4, default: 0, null: false
    t.integer "permanent", limit: 1, default: 0, null: false
  end

  ##add_index "group_instance", ["instance"], name: "instance", using: :btree

  create_table "group_member", primary_key: "memberGuid", force: :cascade do |t|
    t.integer "guid",        limit: 4,             null: false
    t.integer "memberFlags", limit: 1, default: 0, null: false
    t.integer "subgroup",    limit: 1, default: 0, null: false
    t.integer "roles",       limit: 1, default: 0, null: false
  end

  create_table "groups", primary_key: "guid", force: :cascade do |t|
    t.integer "leaderGuid",       limit: 4,             null: false
    t.integer "lootMethod",       limit: 1,             null: false
    t.integer "looterGuid",       limit: 4,             null: false
    t.integer "lootThreshold",    limit: 1,             null: false
    t.integer "icon1",            limit: 8,             null: false
    t.integer "icon2",            limit: 8,             null: false
    t.integer "icon3",            limit: 8,             null: false
    t.integer "icon4",            limit: 8,             null: false
    t.integer "icon5",            limit: 8,             null: false
    t.integer "icon6",            limit: 8,             null: false
    t.integer "icon7",            limit: 8,             null: false
    t.integer "icon8",            limit: 8,             null: false
    t.integer "groupType",        limit: 1,             null: false
    t.integer "difficulty",       limit: 1, default: 0, null: false
    t.integer "raiddifficulty",   limit: 1, default: 0, null: false
    t.integer "masterLooterGuid", limit: 4,             null: false
  end

  #add_index "groups", ["leaderGuid"], name: "leaderGuid", using: :btree

  create_table "guild", primary_key: "guildid", force: :cascade do |t|
    t.string  "name",            limit: 24,  default: "", null: false
    t.integer "leaderguid",      limit: 4,   default: 0,  null: false
    t.integer "EmblemStyle",     limit: 1,   default: 0,  null: false
    t.integer "EmblemColor",     limit: 1,   default: 0,  null: false
    t.integer "BorderStyle",     limit: 1,   default: 0,  null: false
    t.integer "BorderColor",     limit: 1,   default: 0,  null: false
    t.integer "BackgroundColor", limit: 1,   default: 0,  null: false
    t.string  "info",            limit: 500, default: "", null: false
    t.string  "motd",            limit: 128, default: "", null: false
    t.integer "createdate",      limit: 4,   default: 0,  null: false
    t.integer "BankMoney",       limit: 8,   default: 0,  null: false
  end

  create_table "guild_bank_eventlog", id: false, force: :cascade do |t|
    t.integer "guildid",        limit: 4, default: 0, null: false
    t.integer "LogGuid",        limit: 4, default: 0, null: false
    t.integer "TabId",          limit: 1, default: 0, null: false
    t.integer "EventType",      limit: 1, default: 0, null: false
    t.integer "PlayerGuid",     limit: 4, default: 0, null: false
    t.integer "ItemOrMoney",    limit: 4, default: 0, null: false
    t.integer "ItemStackCount", limit: 2, default: 0, null: false
    t.integer "DestTabId",      limit: 1, default: 0, null: false
    t.integer "TimeStamp",      limit: 4, default: 0, null: false
  end

  ##add_index "guild_bank_eventlog", ["LogGuid"], name: "Idx_LogGuid", using: :btree
  #add_index "guild_bank_eventlog", ["PlayerGuid"], name: "Idx_PlayerGuid", using: :btree
  ##add_index "guild_bank_eventlog", ["guildid"], name: "guildid_key", using: :btree

  create_table "guild_bank_item", id: false, force: :cascade do |t|
    t.integer "guildid",   limit: 4, default: 0, null: false
    t.integer "TabId",     limit: 1, default: 0, null: false
    t.integer "SlotId",    limit: 1, default: 0, null: false
    t.integer "item_guid", limit: 4, default: 0, null: false
  end

  ##add_index "guild_bank_item", ["guildid"], name: "guildid_key", using: :btree
  #add_index "guild_bank_item", ["item_guid"], name: "Idx_item_guid", using: :btree

  create_table "guild_bank_right", id: false, force: :cascade do |t|
    t.integer "guildid",    limit: 4, default: 0, null: false
    t.integer "TabId",      limit: 1, default: 0, null: false
    t.integer "rid",        limit: 1, default: 0, null: false
    t.integer "gbright",    limit: 1, default: 0, null: false
    t.integer "SlotPerDay", limit: 4, default: 0, null: false
  end

  ##add_index "guild_bank_right", ["guildid"], name: "guildid_key", using: :btree

  create_table "guild_bank_tab", id: false, force: :cascade do |t|
    t.integer "guildid", limit: 4,   default: 0,  null: false
    t.integer "TabId",   limit: 1,   default: 0,  null: false
    t.string  "TabName", limit: 16,  default: "", null: false
    t.string  "TabIcon", limit: 100, default: "", null: false
    t.string  "TabText", limit: 500
  end

  ##add_index "guild_bank_tab", ["guildid"], name: "guildid_key", using: :btree

  create_table "guild_eventlog", id: false, force: :cascade do |t|
    t.integer "guildid",     limit: 4, null: false
    t.integer "LogGuid",     limit: 4, null: false
    t.integer "EventType",   limit: 1, null: false
    t.integer "PlayerGuid1", limit: 4, null: false
    t.integer "PlayerGuid2", limit: 4, null: false
    t.integer "NewRank",     limit: 1, null: false
    t.integer "TimeStamp",   limit: 4, null: false
  end

  ##add_index "guild_eventlog", ["LogGuid"], name: "Idx_LogGuid", using: :btree
  ##add_index "guild_eventlog", ["PlayerGuid1"], name: "Idx_PlayerGuid1", using: :btree
  ##add_index "guild_eventlog", ["PlayerGuid2"], name: "Idx_PlayerGuid2", using: :btree

  create_table "guild_member", id: false, force: :cascade do |t|
    t.integer "guildid", limit: 4,               null: false
    t.integer "guid",    limit: 4,               null: false
    t.integer "rank",    limit: 1,               null: false
    t.string  "pnote",   limit: 31, default: "", null: false
    t.string  "offnote", limit: 31, default: "", null: false
  end

  ##add_index "guild_member", ["guid"], name: "guid_key", unique: true, using: :btree
  ##add_index "guild_member", ["guildid", "rank"], name: "guildid_rank_key", using: :btree
  ##add_index "guild_member", ["guildid"], name: "guildid_key", using: :btree

  create_table "guild_member_withdraw", primary_key: "guid", force: :cascade do |t|
    t.integer "tab0",  limit: 4, default: 0, null: false
    t.integer "tab1",  limit: 4, default: 0, null: false
    t.integer "tab2",  limit: 4, default: 0, null: false
    t.integer "tab3",  limit: 4, default: 0, null: false
    t.integer "tab4",  limit: 4, default: 0, null: false
    t.integer "tab5",  limit: 4, default: 0, null: false
    t.integer "money", limit: 4, default: 0, null: false
  end

  create_table "guild_rank", id: false, force: :cascade do |t|
    t.integer "guildid",         limit: 4,  default: 0,  null: false
    t.integer "rid",             limit: 1,               null: false
    t.string  "rname",           limit: 20, default: "", null: false
    t.integer "rights",          limit: 3,  default: 0,  null: false
    t.integer "BankMoneyPerDay", limit: 4,  default: 0,  null: false
  end

  ##add_index "guild_rank", ["rid"], name: "Idx_rid", using: :btree

  create_table "instance", force: :cascade do |t|
    t.integer "map",                 limit: 2,   default: 0, null: false
    t.integer "resettime",           limit: 4,   default: 0, null: false
    t.integer "difficulty",          limit: 1,   default: 0, null: false
    t.integer "completedEncounters", limit: 4,   default: 0, null: false
    t.text    "data",                limit: 255,             null: false
  end

  ##add_index "instance", ["difficulty"], name: "difficulty", using: :btree
  ##add_index "instance", ["map"], name: "map", using: :btree
  ##add_index "instance", ["resettime"], name: "resettime", using: :btree

  create_table "instance_reset", id: false, force: :cascade do |t|
    t.integer "mapid",      limit: 2, default: 0, null: false
    t.integer "difficulty", limit: 1, default: 0, null: false
    t.integer "resettime",  limit: 4, default: 0, null: false
  end

  ##add_index "instance_reset", ["difficulty"], name: "difficulty", using: :btree

  create_table "item_instance", primary_key: "guid", force: :cascade do |t|
    t.integer "itemEntry",        limit: 3,     default: 0, null: false
    t.integer "owner_guid",       limit: 4,     default: 0, null: false
    t.integer "creatorGuid",      limit: 4,     default: 0, null: false
    t.integer "giftCreatorGuid",  limit: 4,     default: 0, null: false
    t.integer "count",            limit: 4,     default: 1, null: false
    t.integer "duration",         limit: 4,     default: 0, null: false
    t.text    "charges",          limit: 255
    t.integer "flags",            limit: 3,     default: 0, null: false
    t.text    "enchantments",     limit: 65535,             null: false
    t.integer "randomPropertyId", limit: 2,     default: 0, null: false
    t.integer "durability",       limit: 2,     default: 0, null: false
    t.integer "playedTime",       limit: 4,     default: 0, null: false
    t.text    "text",             limit: 65535
  end

  ##add_index "item_instance", ["owner_guid"], name: "idx_owner_guid", using: :btree

  create_table "item_loot_items", id: false, force: :cascade do |t|
    t.integer "container_id",    limit: 4, default: 0,     null: false
    t.integer "item_id",         limit: 4, default: 0,     null: false
    t.integer "item_count",      limit: 4, default: 0,     null: false
    t.boolean "follow_rules",    default: false, null: false
    t.boolean "ffa",             default: false, null: false
    t.boolean "blocked",         default: false, null: false
    t.boolean "counted",         default: false, null: false
    t.boolean "under_threshold", default: false, null: false
    t.boolean "needs_quest",     default: false, null: false
    t.integer "rnd_prop",        limit: 4, default: 0,     null: false
    t.integer "rnd_suffix",      limit: 4, default: 0,     null: false
  end

  create_table "item_loot_money", id: false, force: :cascade do |t|
    t.integer "container_id", limit: 4, default: 0, null: false
    t.integer "money",        limit: 4, default: 0, null: false
  end

  create_table "item_refund_instance", id: false, force: :cascade do |t|
    t.integer "item_guid",        limit: 4,             null: false
    t.integer "player_guid",      limit: 4,             null: false
    t.integer "paidMoney",        limit: 4, default: 0, null: false
    t.integer "paidExtendedCost", limit: 2, default: 0, null: false
  end

  create_table "item_soulbound_trade_data", primary_key: "itemGuid", force: :cascade do |t|
    t.text "allowedPlayers", limit: 65535, null: false
  end

  create_table "lag_reports", primary_key: "reportId", force: :cascade do |t|
    t.integer "guid",       limit: 4,  default: 0,   null: false
    t.integer "lagType",    limit: 1,  default: 0,   null: false
    t.integer "mapId",      limit: 2,  default: 0,   null: false
    t.float   "posX",       limit: 24, default: 0.0, null: false
    t.float   "posY",       limit: 24, default: 0.0, null: false
    t.float   "posZ",       limit: 24, default: 0.0, null: false
    t.integer "latency",    limit: 4,  default: 0,   null: false
    t.integer "createTime", limit: 4,  default: 0,   null: false
  end

  create_table "lfg_data", primary_key: "guid", force: :cascade do |t|
    t.integer "dungeon", limit: 4, default: 0, null: false
    t.integer "state",   limit: 1, default: 0, null: false
  end

  create_table "mail", force: :cascade do |t|
    t.integer "messageType",    limit: 1,          default: 0,  null: false
    t.integer "stationery",     limit: 1,          default: 41, null: false
    t.integer "mailTemplateId", limit: 2,          default: 0,  null: false
    t.integer "sender",         limit: 4,          default: 0,  null: false
    t.integer "receiver",       limit: 4,          default: 0,  null: false
    t.text    "subject",        limit: 1073741823
    t.text    "body",           limit: 1073741823
    t.integer "has_items",      limit: 1,          default: 0,  null: false
    t.integer "expire_time",    limit: 4,          default: 0,  null: false
    t.integer "deliver_time",   limit: 4,          default: 0,  null: false
    t.integer "money",          limit: 4,          default: 0,  null: false
    t.integer "cod",            limit: 4,          default: 0,  null: false
    t.integer "checked",        limit: 1,          default: 0,  null: false
  end

  ##add_index "mail", ["receiver"], name: "idx_receiver", using: :btree

  create_table "mail_items", primary_key: "item_guid", force: :cascade do |t|
    t.integer "mail_id",  limit: 4, default: 0, null: false
    t.integer "receiver", limit: 4, default: 0, null: false
  end

  ##add_index "mail_items", ["mail_id"], name: "idx_mail_id", using: :btree
  ##add_index "mail_items", ["receiver"], name: "idx_receiver", using: :btree

  create_table "pet_aura", id: false, force: :cascade do |t|
    t.integer "guid",             limit: 4, default: 0, null: false
    t.integer "caster_guid",      limit: 8, default: 0, null: false
    t.integer "spell",            limit: 3, default: 0, null: false
    t.integer "effect_mask",      limit: 1, default: 0, null: false
    t.integer "recalculate_mask", limit: 1, default: 0, null: false
    t.integer "stackcount",       limit: 1, default: 1, null: false
    t.integer "amount0",          limit: 3,             null: false
    t.integer "amount1",          limit: 3,             null: false
    t.integer "amount2",          limit: 3,             null: false
    t.integer "base_amount0",     limit: 3,             null: false
    t.integer "base_amount1",     limit: 3,             null: false
    t.integer "base_amount2",     limit: 3,             null: false
    t.integer "maxduration",      limit: 4, default: 0, null: false
    t.integer "remaintime",       limit: 4, default: 0, null: false
    t.integer "remaincharges",    limit: 1, default: 0, null: false
  end

  create_table "pet_spell", id: false, force: :cascade do |t|
    t.integer "guid",   limit: 4, default: 0, null: false
    t.integer "spell",  limit: 3, default: 0, null: false
    t.integer "active", limit: 1, default: 0, null: false
  end

  create_table "pet_spell_cooldown", id: false, force: :cascade do |t|
    t.integer "guid",  limit: 4, default: 0, null: false
    t.integer "spell", limit: 3, default: 0, null: false
    t.integer "time",  limit: 4, default: 0, null: false
  end

  create_table "petition", id: false, force: :cascade do |t|
    t.integer "ownerguid",    limit: 4,              null: false
    t.integer "petitionguid", limit: 4,  default: 0
    t.string  "name",         limit: 24,             null: false
    t.integer "type",         limit: 1,  default: 0, null: false
  end

  ##add_index "petition", ["ownerguid", "petitionguid"], name: "index_ownerguid_petitionguid", unique: true, using: :btree

  create_table "petition_sign", id: false, force: :cascade do |t|
    t.integer "ownerguid",      limit: 4,             null: false
    t.integer "petitionguid",   limit: 4, default: 0, null: false
    t.integer "playerguid",     limit: 4, default: 0, null: false
    t.integer "player_account", limit: 4, default: 0, null: false
    t.integer "type",           limit: 1, default: 0, null: false
  end

  ##add_index "petition_sign", ["ownerguid"], name: "Idx_ownerguid", using: :btree
  ##add_index "petition_sign", ["playerguid"], name: "Idx_playerguid", using: :btree

  create_table "pool_quest_save", id: false, force: :cascade do |t|
    t.integer "pool_id",  limit: 4, default: 0, null: false
    t.integer "quest_id", limit: 4, default: 0, null: false
  end

  create_table "pvpstats_battlegrounds", force: :cascade do |t|
    t.integer  "winner_faction", limit: 1, null: false
    t.integer  "bracket_id",     limit: 1, null: false
    t.integer  "type",           limit: 1, null: false
    t.datetime "date",                     null: false
  end

  create_table "pvpstats_players", id: false, force: :cascade do |t|
    t.integer "battleground_id",       limit: 8,             null: false
    t.integer "character_guid",        limit: 4,             null: false
    t.integer "score_killing_blows",   limit: 3,             null: false
    t.integer "score_deaths",          limit: 3,             null: false
    t.integer "score_honorable_kills", limit: 3,             null: false
    t.integer "score_bonus_honor",     limit: 3,             null: false
    t.integer "score_damage_done",     limit: 3,             null: false
    t.integer "score_healing_done",    limit: 3,             null: false
    t.integer "attr_1",                limit: 3, default: 0, null: false
    t.integer "attr_2",                limit: 3, default: 0, null: false
    t.integer "attr_3",                limit: 3, default: 0, null: false
    t.integer "attr_4",                limit: 3, default: 0, null: false
    t.integer "attr_5",                limit: 3, default: 0, null: false
  end

  create_table "quest_tracker", id: false, force: :cascade do |t|
    t.integer  "id",                  limit: 3,   default: 0,     null: false
    t.integer  "character_guid",      limit: 4,   default: 0,     null: false
    t.datetime "quest_accept_time",                               null: false
    t.datetime "quest_complete_time"
    t.datetime "quest_abandon_time"
    t.boolean  "completed_by_gm",     default: false, null: false
    t.string   "core_hash",           limit: 120, default: "0",   null: false
    t.string   "core_revision",       limit: 120, default: "0",   null: false
  end

  create_table "reserved_name", primary_key: "name", force: :cascade do |t|
  end

  create_table "updates", primary_key: "name", force: :cascade do |t|
    t.string   "hash",      limit: 40, default: ""
    t.string   "state",     limit: 8,  default: "RELEASED", null: false
    t.datetime "timestamp",                                 null: false
    t.integer  "speed",     limit: 4,  default: 0,          null: false
  end

  create_table "updates_include", primary_key: "path", force: :cascade do |t|
    t.string "state", limit: 8, default: "RELEASED", null: false
  end

  create_table "warden_action", primary_key: "wardenId", force: :cascade do |t|
    t.integer "action", limit: 1
  end

  create_table "worldstates", primary_key: "entry", force: :cascade do |t|
    t.integer "value",   limit: 4,   default: 0, null: false
    t.text    "comment", limit: 255
  end

end
