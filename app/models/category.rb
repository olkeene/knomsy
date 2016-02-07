class Category < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  validates :category_funding, :companies_count, :funding_companies_count,
    :live_startups_site,
    presence: true, numericality: {only_integer: true}
    
  validates :ppi, :rmtcat, :amstc, :asstcat, 
    numericality: {greater_than_or_equal_to: 0}, allow_nil: true
    
  scope :for_autocomplete, -> { select('id, name as value') }
  scope :query, ->(name) {
    name.present? ? where('name ilike ?', "%#{name}%") : scope
  }
end
