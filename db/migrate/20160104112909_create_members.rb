class CreateMembers < ActiveRecord::Migration
  def change
    create_table :company_users do |t|
      t.integer :company_id
      t.string  :name,  limit: 100, null: false
      t.integer :role,  limit: 3,  null: false
      t.string  :title, limit: 50, null: false
    end
    
    add_index :company_users, :company_id
  end
end
