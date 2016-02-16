class SurveyQuestion < ActiveRecord::Base
  COUNT = count
  
  validates :q, length: {minimum: 1, maximum: 255}
  
  has_many :answers, class_name: :SurveyAnswer, foreign_key: :survey_question_id
  
  scope :left_for, ->(user, company, skip_id = nil){ 
    # skip active answered questions 
    scope = where.not(id: 
      company.survey_answers.user(user).not_completed.distinct.pluck(:survey_question_id))
    scope = scope.where.not(id: skip_id) if skip_id
    scope 
  }
end
