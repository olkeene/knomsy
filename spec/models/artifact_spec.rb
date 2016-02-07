require 'rails_helper'

RSpec.describe Artifact, type: :model do
  it { should validate_presence_of(:type) }
  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name).scoped_to(:type) }
end
