require 'rails_helper'

RSpec.describe Artifact, type: :model do
  it { expect validate_presence_of(:type) }
  
  it { expect validate_presence_of(:name) }
  it { expect validate_uniqueness_of(:name).scoped_to(:type) }
end
