require 'rails_helper'

RSpec.describe CompanyUser, type: :model do
  it { should validate_presence_of(:company_id) }
  it { should validate_presence_of(:role) }
  
  it { should validate_length_of(:name).is_at_least(2).is_at_most(100) }
  it { should validate_length_of(:title).is_at_least(2).is_at_most(50) }
end
