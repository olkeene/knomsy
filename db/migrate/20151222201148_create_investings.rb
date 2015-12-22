class CreateInvestings < ActiveRecord::Migration
  def change
    create_table :investings do |t|
      t.integer :user_id
      t.string  :amount
      t.integer :deals_year,      limit: 4
      t.integer :confirmed_deals, limit: 4
    end
    add_index :investings, :user_id
  end
end
