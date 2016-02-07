require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_length_of(:first_name).is_at_least(2).is_at_most(50) }
  it { should validate_length_of(:last_name).is_at_least(2).is_at_most(50) }
  it { should validate_length_of(:username).is_at_least(2).is_at_most(50) }
  
  # it { should validate_presence_of(:country_id) }

  [ :city,
    :gplay_link, :itunes_link, :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link, :website
  ].each do |attr|
    it { should validate_length_of(attr).is_at_most(255) }
  end
end
