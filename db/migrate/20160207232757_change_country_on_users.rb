class ChangeCountryOnUsers < ActiveRecord::Migration
  def up
    add_column :users, :country_id, :integer
    add_index  :users, :country_id
    
    remove_column :users, :country
  end
  
  def down
    add_column :users, :country, :string
    
    remove_column :users, :country_id
  end
end
