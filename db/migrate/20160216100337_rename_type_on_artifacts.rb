class RenameTypeOnArtifacts < ActiveRecord::Migration
  def up
    rename_column :artifacts, :type, :kind
  end
  
  def down
    rename_column :artifacts, :kind, :type
  end
end
