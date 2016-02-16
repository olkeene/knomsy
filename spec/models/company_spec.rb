require 'rails_helper'

RSpec.describe Company, type: :model do
  it { expect validate_presence_of(:user_id) }
  
  it { expect validate_length_of(:name).is_at_least(2).is_at_most(50) }
  it { expect validate_length_of(:description).is_at_least(0).is_at_most(500) }
  
  it { expect validate_presence_of(:country_id) }
  
  [:city, :market].each do |attr|
    it { expect validate_presence_of(attr) }
    it { expect validate_length_of(attr).is_at_most(255) }
  end
  
  [:gplay_link, :itunes_link, :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link, :website
  ].each do |attr|
    it { expect validate_length_of(attr).is_at_most(255) }
  end
  
  it { expect validate_length_of(:short_name).is_at_least(2).is_at_most(50) }
  
  describe 'category_ids' do
    it 'should have error' do
      subject.valid?
      expect(subject.errors[:category_list]).to eq(['should have at least 1 assigned category'])
    end
    
    it 'should not have error' do
      subject.category_list = create(:category).name
      subject.valid?
      expect(subject.errors[:category_list]).to be_empty
    end
  end
  
  describe 'recalc_index' do
    subject { build(:company) }
    
    it 'should have def value' do
      expect(subject.rating).to eq(0)
    end
    
    it 'should not recalc' do
      subject.country      = nil
      subject.category_ids = nil
      
      expect_any_instance_of(IndexCal).to_not receive(:calc)
    end
    
    it 'should recalc' do
      subject.country      = create(:country)
      subject.category_ids = [create(:category).id]
      
      expect_any_instance_of(IndexCal).to receive_messages(calc: 999)
      
      subject.save!
      
      expect(subject.rating).to eq(999)
    end
    
    describe '#rating_change' do
      it 'should change' do
        subject.country      = create(:country)
        subject.category_ids = [create(:category).id]
        
        expect_any_instance_of(IndexCal).to receive_messages(calc: 999)
        
        expect(subject.rating).to eq(0)
        expect(subject.rating_trend).to eq(0)
        
        subject.save!
        
        expect(subject.rating).to eq(999)
        expect(subject.rating_trend).to eq(999)
      end
    end
  end
end
