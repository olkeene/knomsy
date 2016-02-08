class ChangeCategoryIdToArrayOnCompanies < ActiveRecord::Migration
  def up
    add_column    :companies, :category_ids, :integer, array: true
    remove_column :companies, :category_id
  end
  
  def down
    add_column    :companies, :category_id, :integer
    remove_column :companies, :category_ids
  end
end
