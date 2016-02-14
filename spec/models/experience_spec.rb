require 'rails_helper'

RSpec.describe Experience, type: :model do
  it { expect validate_presence_of(:user_id) }
  it { expect validate_presence_of(:role) }
  it { expect validate_presence_of(:started_at) }
  it { expect validate_presence_of(:ended_at) }
  
  it { expect validate_length_of(:company_name).is_at_most(255) }
  it { expect validate_length_of(:title).is_at_most(255) }
  it { expect validate_length_of(:description).is_at_most(500) }
end
