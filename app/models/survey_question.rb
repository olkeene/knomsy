class SurveyQuestion < ActiveRecord::Base
  COUNT = count
  
  validates :q, length: {minimum: 1, maximum: 255}
  
  has_many :answers, class_name: :SurveyAnswer, foreign_key: :survey_question_id
  
  scope :left_for, ->(user, company){ 
    # skip active answered questions 
    where.not(id: 
      company.survey_answers.user(user).not_completed.pluck(:survey_question_id))
  }
end
