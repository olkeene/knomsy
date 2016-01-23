require 'rails_helper'
require 'ability'

RSpec.describe Ability do
  let!(:user){ create :user }
  subject { Ability.new(user) }

  describe 'company profile' do
    it 'should allow to edit' do
      company = Company.new(user_id: user.id)
      
      subject.can?(:edit, company).should eq(true)
    end
    
    it 'should not allow to edit' do
      company = Company.new(user_id: user.id + 1)
      
      subject.can?(:edit, company).should eq(false)
    end
  end

  describe 'user profile' do
    describe 'should allow to edit' do
      it 'user' do
        _user = User.new(id: user.id)
        
        subject.can?(:edit, _user).should eq(true)
      end
      
      it 'decorated user' do
        _user = User.new(id: user.id).decorate
        
        subject.can?(:edit, _user).should eq(true)
      end
    end
    
    it 'should not allow to edit' do
      _user = User.new(id: user.id + 1)
      
      subject.can?(:edit, _user).should eq(false)
    end
  end
end
