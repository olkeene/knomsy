FactoryGirl.define do
  factory :company do
    user
    
    sequence(:name) {|n| "name#{n}" }
    sequence(:short_name) {|n| "short_name#{n}" }
    description 'foooo'
    
    country
    category_list { create(:category).name }
    city   'LA'
    market 'mobile'
  end
end
