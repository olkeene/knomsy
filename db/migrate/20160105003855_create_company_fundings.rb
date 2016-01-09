class CreateCompanyFundings < ActiveRecord::Migration
  def change
    create_table :company_fundings do |t|
      t.integer :company_id, null: false
      
      t.date    :funded_on, null: false
      t.integer :round,     null: false
      t.integer :amount,    null: false
      t.string  :investors, array: true
      t.string  :link_desc
      t.string  :link
      t.boolean :visible, null: false, default: true
    end
    
    add_index :company_fundings, :company_id
    add_index :company_fundings, [:company_id, :visible]
  end
end
