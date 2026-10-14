ActiveRecord::Schema[8.0].define(version: 1) do
  create_table "employees", force: true do |t|
    t.string "employee_number", null: false
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "country", null: false
    t.string "department", null: false
    t.string "job_title", null: false
    t.string "employment_status", null: false
    t.date "joining_date", null: false
    t.timestamps
  end
  add_index "employees", "employee_number", unique: true
  add_index "employees", "email", unique: true
  add_index "employees", "country"
  add_index "employees", "department"
  create_table "salaries", force: true do |t|
    t.references "employee", null: false, foreign_key: true
    t.decimal "amount", precision: 14, scale: 2, null: false
    t.string "currency", null: false
    t.date "effective_from", null: false
    t.timestamps
  end
  add_index "salaries", ["employee_id", "effective_from"]
end
