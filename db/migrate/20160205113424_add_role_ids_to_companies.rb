class AddRoleIdsToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :role_ids, :integer, array: true
  end
end
