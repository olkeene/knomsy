require 'rails_helper'

RSpec.describe SurveyQuestion, type: :model do
  it { should validate_length_of(:q).is_at_least(1).is_at_most(255) }
end
