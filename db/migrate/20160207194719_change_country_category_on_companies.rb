class ChangeCountryCategoryOnCompanies < ActiveRecord::Migration
  def up
    add_column :companies, :country_id,  :integer
    add_column :companies, :category_id, :integer
    
    add_index  :companies, :country_id
    add_index  :companies, :category_id
    
    remove_column :companies, :country
    remove_column :companies, :category
  end
  
  def down
    add_column :companies, :country,  :string
    add_column :companies, :category, :string
    
    remove_column :companies, :country_id
    remove_column :companies, :category_id
  end
end
