class SurveyQuestion < ActiveRecord::Base
  validates :q, length: {minimum: 1, maximum: 255}
  
  has_many :answers, class_name: :SurveyAnswer, foreign_key: :survey_question_id
end
