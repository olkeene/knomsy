FactoryGirl.define do
  factory :category do
    sequence(:name) {|n| "category#{n}" }
    
    category_funding 1
    companies_count  1
    funding_companies_count 1
    live_startups_site 1
  end
end
