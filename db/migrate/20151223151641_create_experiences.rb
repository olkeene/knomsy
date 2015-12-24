class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.integer :user_id
      t.string  :company_name,   null: false
      t.integer :role, limit: 3, null: false
      t.string  :title,          null: false
      t.date    :started_at,     null: false
      t.date    :ended_at,       null: false
      t.boolean :current, default: false, null: false
      t.text    :description
    end
    
    add_index :experiences, [:user_id, :role]
  end
end
