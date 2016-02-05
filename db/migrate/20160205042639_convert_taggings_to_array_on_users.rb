class ConvertTaggingsToArrayOnUsers < ActiveRecord::Migration
  def change
    add_column :users, :skill_ids,   :integer, array: true
    add_column :users, :role_ids,    :integer, array: true
    add_column :users, :service_ids, :integer, array: true
  end
end
