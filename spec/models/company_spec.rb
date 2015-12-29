require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should validate_length_of(:name).is_at_least(2).is_at_most(50) }
  it { should validate_length_of(:description).is_at_least(0).is_at_most(500) }
  
  it { should validate_presence_of(:country) }
  it { should validate_presence_of(:city) }
  it { should validate_presence_of(:market) }
  it { should validate_presence_of(:category) }
  
  it { should validate_length_of(:short_name).is_at_least(2).is_at_most(50) }
end
