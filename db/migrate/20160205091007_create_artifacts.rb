class CreateArtifacts < ActiveRecord::Migration
  def change
    create_table :artifacts do |t|
      t.string  :name
      t.integer :type, limit: 2
    end
    
    add_index :artifacts, [:name, :type]
    add_index :artifacts, :type
  end
end
