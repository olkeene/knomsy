class SurveyAnswer < ActiveRecord::Base
  TYPES = {yes: 1, no: 2, partly: 3, dont_know: 4}
  
  belongs_to :user
  belongs_to :question, class_name: :SurveyQuestion, foreign_key: :survey_question_id
  
  validates :survey_question_id, :user_id, presence: true
end
