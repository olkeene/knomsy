require 'rails_helper'

RSpec.describe CompanyUser, type: :model do
  it { expect validate_presence_of(:company_id) }
  it { expect validate_presence_of(:role) }
  
  it { expect validate_length_of(:name).is_at_least(2).is_at_most(100) }
  it { expect validate_length_of(:title).is_at_least(2).is_at_most(50) }
end
