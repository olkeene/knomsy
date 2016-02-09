FactoryGirl.define do
  factory :country do
    sequence(:name) {|n| "company#{n}" }
    
    startups_count 1
    funded_startups_count 1
    earned_money 1
    live_startups_site 1
  end
end
