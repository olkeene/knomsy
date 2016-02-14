require 'rails_helper'

RSpec.describe Country, type: :model do
  it { expect validate_presence_of(:name) }
  it { expect validate_uniqueness_of(:name) }

  [:startups_count, :funded_startups_count, :earned_money, :live_startups_site].each do |attr|
    it { expect validate_presence_of(attr) }
    
    # suspended until https://github.com/thoughtbot/shoulda-matchers/issues/784
    # it { 
    #   expect validate_numericality_of(attr).only_integer
    # }
  end
  
  [:ppi, :rmtcon, :amstcon, :asstcon].each do |attr|
    # it { expect validate_presence_of(attr) }
    
    # suspended until https://github.com/thoughtbot/shoulda-matchers/issues/784
    it { 
      expect validate_numericality_of(attr).is_greater_than_or_equal_to(0)
    }
  end
end
