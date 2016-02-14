FactoryGirl.define do
  factory :survey_answer do
    user
    company
    question factory: :survey_question
    
    answer_type 'yes'
  end
end
