require 'rails_helper'

RSpec.describe Investing, type: :model do
  it { expect validate_presence_of(:user_id) }
  it { expect validate_length_of(:amount).is_at_most(50) }
  
  # suspended until https://github.com/thoughtbot/shoulda-matchers/issues/784
  # it { 
  #   expect validate_numericality_of(:deals_year).only_integer.
  #     is_greater_than_or_equal_to(0).is_less_than_or_equal_to(9999)
  # }
  
  # it { 
  #   expect validate_numericality_of(:confirmed_deals).only_integer.
  #     is_greater_than_or_equal_to(0).is_less_than_or_equal_to(9999)
  # }
end
