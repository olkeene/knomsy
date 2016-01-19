class UnnullifyEndedAtOnExperinces < ActiveRecord::Migration
  def up
    change_column :experiences, :ended_at, :date, null: true
  end
  
  def down
    change_column :experiences, :ended_at, :date, null: false
  end
end
