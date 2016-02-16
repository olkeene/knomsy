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
      it 'should allow' do
        company = Company.new(user: other_user)
        
        expect(subject.can?(:took_survey, company)).to eq(true)
      end
      
      it 'should not allow if owner' do
        company = Company.new(user_id: user.id)
        
        expect(subject.can?(:took_survey, company)).to eq(false)
      end
      
      it 'should not allow if voted' do
        company = create :company, user: other_user
        answer  = create :survey_answer, company: company, user: user, status: 'completed'
        
        expect(subject.can?(:took_survey, company)).to eq(false)
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
