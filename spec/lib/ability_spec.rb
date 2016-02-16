require 'rails_helper'
require 'ability'

RSpec.describe Ability do
  let!(:user){ create :user }
  let(:other_user){ create :user }
  
  subject { Ability.new(user) }

  describe 'company profile' do
    context 'edit' do
      it 'should allow' do
        company = Company.new(user_id: user.id)
        
        expect(subject.can?(:edit, company)).to eq(true)
      end
      
      it 'should not allow' do
        company = Company.new(user: other_user)
        
        expect(subject.can?(:edit, company)).to eq(false)
      end
    end
    
    context 'survey' do
      context 'can vote' do
        it 'if unvotted' do
          company = Company.new(user: other_user)
          
          expect(subject.can?(:took_survey, company)).to eq(true)
        end
        
        it "if voted #{SurveyAnswer::ANSWER_TIME_LIMIT / 60} mins.ago" do
          company = create :company, user: other_user
          answer  = create :survey_answer, company: company, user: user, status: 'completed', created_at: SurveyAnswer::ANSWER_TIME_LIMIT.ago
          
          expect(subject.can?(:took_survey, company)).to eq(true)
        end
        
        it "if voted > #{SurveyAnswer::ANSWER_TIME_LIMIT  / 60} mins.ago" do
          company = create :company, user: other_user
          answer  = create :survey_answer, company: company, user: user, status: 'completed', created_at: (SurveyAnswer::ANSWER_TIME_LIMIT + 1).ago
          
          expect(subject.can?(:took_survey, company)).to eq(true)
        end
      end
      
      context 'can\'t vote' do
        it 'if owner' do
          company = Company.new(user_id: user.id)
          
          expect(subject.can?(:took_survey, company)).to eq(false)
        end
      end
    end
  end

  describe 'user profile' do
    describe 'should allow to edit' do
      it 'user' do
        _user = User.new(id: user.id)
        
        expect(subject.can?(:edit, _user)).to eq(true)
      end
      
      it 'decorated user' do
        _user = User.new(id: user.id).decorate
        
        expect(subject.can?(:edit, _user)).to eq(true)
      end
    end
    
    it 'should not allow to edit' do
      _user = User.new(id: user.id + 1)
      
      expect(subject.can?(:edit, _user)).to eq(false)
    end
  end
end
