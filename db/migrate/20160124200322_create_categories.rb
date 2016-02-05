class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string   :name, null: false
      t.integer  :category_funding, limit: 8
      t.integer  :companies_count
      t.integer  :funding_companies_count
      t.float    :ppi
      t.float    :rmtcat
      t.float    :amstc
      t.integer  :live_startups_site
      t.float    :asstcat
    end
    add_index :categories, :name
  end
end
