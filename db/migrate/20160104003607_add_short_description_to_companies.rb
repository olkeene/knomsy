class AddShortDescriptionToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :short_desc, :string
  end
end
