class AddRatingChangeToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :rating_trend, :decimal, precision: 6, scale: 2, default: 0
  end
end
