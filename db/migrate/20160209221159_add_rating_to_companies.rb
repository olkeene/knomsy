class AddRatingToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :rating, :decimal, precision: 6, scale: 2, default: 0
  end
end
