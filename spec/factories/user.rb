FactoryGirl.define do
  factory :user do
    sequence(:email) {|n| "email#{n}@factory.com" }
    password Faker::Internet.password
    
    first_name 'Oleg'
    last_name  'Keene'
  end
end
