class AddShortResumeWhatDoToUsers < ActiveRecord::Migration
  def up
    change_column :users, :about,        :text, limit: 500
    
    add_column    :users, :short_resume, :text, limit: 500
    add_column    :users, :what_do,      :text, limit: 500
  end
  
  def down
    change_column :users, :about, :string
    
    remove_column :users, :short_resume
    remove_column :users, :what_do
  end
end
