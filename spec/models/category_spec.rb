require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }

  [:category_funding, :companies_count, :funding_companies_count, :live_startups_site].each do |attr|
    it { should validate_presence_of(attr) }
    
    # suspended until https://github.com/thoughtbot/shoulda-matchers/issues/784
    # it { 
    #   should validate_numericality_of(attr).only_integer
    # }
  end
  
  [:ppi, :rmtcat, :amstc, :asstcat].each do |attr|
    it { should validate_presence_of(attr) }
    
    # suspended until https://github.com/thoughtbot/shoulda-matchers/issues/784
    it { 
      should validate_numericality_of(attr).is_greater_than_or_equal_to(0)
    }
  end
end
