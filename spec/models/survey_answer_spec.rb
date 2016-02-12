require 'rails_helper'

RSpec.describe SurveyAnswer, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:survey_question_id) }
end
