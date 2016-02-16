FactoryGirl.define do
  factory :survey_question do
    sequence(:q) {|n| "q#{n}" }
    target 'foo'
  end
end
