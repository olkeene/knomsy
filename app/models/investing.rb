class Investing < ActiveRecord::Base
  belongs_to :user
  
  acts_as_ordered_taggable_on :markets, :countries, :currencies
  
  validates :user_id, presence: true
  validates :amount, length: {maximum: 50}, allow_blank: true
  validates :deals_year, :confirmed_deals, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 9999}, allow_blank: true
end
