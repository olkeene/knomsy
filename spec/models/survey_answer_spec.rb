require 'rails_helper'

RSpec.describe SurveyAnswer, type: :model do
  it { expect validate_presence_of(:user_id) }
  it { expect validate_presence_of(:survey_question_id) }
  it { expect validate_presence_of(:company_id) }
  it { expect validate_presence_of(:answer_type) }
  
  describe '.sum_answers' do
    subject { SurveyAnswer.sum_answers.order(nil).first.sum }
    
    it 'should calc right' do
      create :survey_answer, answer_type: 'yes'
      
      expect(subject).to eq(1)
    end
    
    it 'should calc right' do
      create :survey_answer, answer_type: 'no'
      
      expect(subject).to eq(-1)
    end
    
    it 'should calc right' do
      create :survey_answer, answer_type: 'partly'
      
      expect(subject).to eq(0.5)
    end
    
    it 'should calc right' do
      create :survey_answer, answer_type: 'dont_know'
      
      expect(subject).to eq(0)
    end
    
    it 'should calc right' do
      create :survey_answer, answer_type: 'yes'
      create :survey_answer, answer_type: 'yes'
      create :survey_answer, answer_type: 'no'
      create :survey_answer, answer_type: 'partly'
      create :survey_answer, answer_type: 'dont_know'
      
      expect(subject).to eq(1.5)
    end
  end
  
  pending '#mark_for_index'
end
