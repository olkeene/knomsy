class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string  :name, null: false
      t.integer :startups_count
      t.integer :funded_startups_count
      t.float   :ppi
      t.float   :rmtcon
      t.bigint  :earned_money
      t.float   :amstcon
      t.integer :live_startups_site
      t.float   :asstcon
    end
    add_index :countries, :name
  end
end
