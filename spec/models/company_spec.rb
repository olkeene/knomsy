require 'rails_helper'

RSpec.describe Company, type: :model do
  it { should validate_length_of(:name).is_at_least(2).is_at_most(50) }
  it { should validate_length_of(:description).is_at_least(0).is_at_most(500) }
  
  it { should validate_presence_of(:country_id) }
  
  [:city, :market].each do |attr|
    it { should validate_presence_of(attr) }
    it { should validate_length_of(attr).is_at_most(255) }
  end
  
  [:gplay_link, :itunes_link, :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link, :website
  ].each do |attr|
    it { should validate_length_of(attr).is_at_most(255) }
  end
  
  it { should validate_length_of(:short_name).is_at_least(2).is_at_most(50) }
  
  describe 'category_ids' do
    it 'should have error' do
      subject.valid?
      subject.errors[:category_list].should eq(['should have at least 1 assigned category'])
    end
    
    it 'should not have error' do
      subject.category_list = create(:category).name
      subject.valid?
      subject.errors[:category_list].should be_empty
    end
  end
end
