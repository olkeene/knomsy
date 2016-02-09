require 'rails_helper'
require 'ability'

RSpec.describe Ability do
  let!(:user){ create :user }
  subject { Ability.new(user) }

  describe 'company profile' do
    it 'should allow to edit' do
      company = Company.new(user_id: user.id)
      
      expect(subject.can?(:edit, company)).to eq(true)
    end
    
    it 'should not allow to edit' do
      company = Company.new(user_id: user.id + 1)
      
      expect(subject.can?(:edit, company)).to eq(false)
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
