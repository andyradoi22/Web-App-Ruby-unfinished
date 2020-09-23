ActiveRecord::Schema.define(version: 2020_07_27_152134) do

    create_table "boards", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
      t.string "name"
      t.text "description"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  
    create_table "columns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
      t.string "title"
      t.integer "order"
      t.bigint "board_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["board_id"], name: "index_columns_on_board_id"
    end
  
    create_table "entries", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
      t.string "title"
      t.integer "level"
      t.bigint "user_id", null: false
      t.bigint "board_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["board_id"], name: "index_entries_on_board_id"
      t.index ["user_id"], name: "index_entries_on_user_id"
    end
  
    create_table "stories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
      t.string "task"
      t.text "info"
      t.integer "order"
      t.text "tag"
      t.text "status"
      t.datetime "due"
      t.bigint "column_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["column_id"], name: "index_stories_on_column_id"
    end
  
    create_table "tasks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
      t.bigint "user_id", null: false
      t.bigint "story_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["story_id"], name: "index_tasks_on_story_id"
      t.index ["user_id"], name: "index_tasks_on_user_id"
    end
  
    create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4", force: :cascade do |t|
      t.string "email", default: "", null: false
      t.string "encrypted_password", default: "", null: false
      t.string "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
  
    add_foreign_key "columns", "boards"
    add_foreign_key "entries", "boards"
    add_foreign_key "entries", "users"
    add_foreign_key "stories", "columns"
    add_foreign_key "tasks", "stories"
    add_foreign_key "tasks", "users"
  end