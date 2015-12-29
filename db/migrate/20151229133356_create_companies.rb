class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.belongs_to :user, null: false, index: true
      t.string :name, limit: 50
      t.text   :description, limit: 500
      t.string :country,  null: false
      t.string :city,     null: false
      t.string :market,   null: false
      t.string :category, null: false
      t.string :short_name, null: false, limit: 50
      
      t.string :slug, null: false, limit: 100
    end
    
    add_index  :companies, :slug, unique: true
  end
end
