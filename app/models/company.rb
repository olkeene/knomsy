class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_name, use: :slugged
  
  validates :name, :short_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, length: {maximum: 500}
  validates :country, :city, :market, :category, presence: true

  validates_acceptance_of :terms_of_service, on: :create
  
  #TODO deal with category, country, city and market fields, Make it as associations or scoped tags
end
