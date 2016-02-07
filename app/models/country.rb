class Country < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  
  validates :startups_count, :funded_startups_count, :earned_money,
    :live_startups_site,
    presence: true, numericality: {only_integer: true}
    
  validates :ppi, :rmtcon, :amstcon, :asstcon, 
    numericality: {greater_than_or_equal_to: 0}, allow_nil: true
    
  scope :for_autocomplete, -> { select('id, name as value') }
  scope :query, ->(name) {
    name.present? ? where('name ilike ?', "%#{name}%") : scope
  }
end
