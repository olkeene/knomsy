class SurveyAnswer < ActiveRecord::Base
  # TYPES = {yes: 1, no: 2, partly: 3, dont_know: 4}
  
  enum answer_type: [:yes, :no, :partly, :dont_know]
  enum status:      [:not_completed, :for_index, :completed]
  
  belongs_to :user
  belongs_to :company
  belongs_to :question, class_name: :SurveyQuestion, foreign_key: :survey_question_id
  
  validates :survey_question_id, :user_id, :company_id, :answer_type, presence: true
  
  scope :company, ->(company){ where company: company }
  scope :user,       ->(user){ where user: user }
  scope :not_completed,    ->{ where status: statuses[:not_completed] }
  scope :for_index,        ->{ where status: statuses[:for_index] }
  
  scope :user_not_completed, ->(user){ 
    all.user(user).not_completed
  }
  scope :company_user_not_completed, ->(company, user){ 
    all.company(company).user(user).not_completed
  }
  scope :sum_answers, ->{ select("SUM(CASE 
    WHEN answer_type = %{yes}    THEN 1 
    WHEN answer_type = %{no}     THEN -1 
    WHEN answer_type = %{partly} THEN 0.5 
    ELSE 0 END) as sum" % answer_types.symbolize_keys) }
  
  after_commit :mark_for_index
  
  private
  
  #TODO specs
  def mark_for_index
    return if completed? || for_index?
    
    scope = company.survey_answers.user_not_completed(user)
    
    answers_count   = scope.count
    questions_count = SurveyQuestion.count
    
    if answers_count == questions_count
      self.class.transaction do
        answer_ids = scope.pluck(:id)
        
        # mark for index
        scope.update_all status: self.class.statuses[:for_index]
        
        # all previous answers
        scope
          .where.not(id: answer_ids)
          .update_all status: self.class.statuses[:completed]
      end
      
      company.recalc_index(true)
      company.save!
    elsif answers_count > questions_count
      raise "issue with callback. Company_id: #{company_id}, answer_id: #{id}"
    end
  end
end
