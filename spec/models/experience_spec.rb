require 'rails_helper'

RSpec.describe Experience, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:started_at) }
  it { should validate_presence_of(:ended_at) }
  
  it { should validate_length_of(:company_name).is_at_most(255) }
  it { should validate_length_of(:title).is_at_most(255) }
  it { should validate_length_of(:description).is_at_most(500) }
end
