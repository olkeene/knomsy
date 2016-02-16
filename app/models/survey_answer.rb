class SurveyAnswer < ActiveRecord::Base
  ANSWER_TIME_LIMIT = 5.minutes
  
  enum answer_type: [:yes, :no, :partly, :dont_know]
  enum status:      [:not_completed, :for_index, :completed]
  
  belongs_to :user,    required: true
  belongs_to :company, required: true
  belongs_to :question, class_name: :SurveyQuestion, foreign_key: :survey_question_id, required: true
  
  validates :answer_type, presence: true
  
  scope :company, ->(company){ where company: company }
  scope :user,       ->(user){ where user: user }
  scope :not_completed,    ->{ where status: statuses[:not_completed] }
  scope :for_index,        ->{ where status: statuses[:for_index] }
  scope :last_voted,       ->{ order created_at: :desc }
  
  scope :user_not_completed, ->(user){ 
    all.user(user).not_completed
  }
  scope :user_completed, ->(user){ 
    all.user(user).completed
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
    return unless not_completed?
    
    not_completed_scope = company.survey_answers.user_not_completed(user)
    
    answers_count = not_completed_scope.count
    
    if answers_count == SurveyQuestion::COUNT
      not_completed_answer_ids   = not_completed_scope.pluck(:id)
      company_user_answers_scope = company.survey_answers.user(user)
        
      # mark all previous as voted
      company_user_answers_scope
        .where.not(id: not_completed_answer_ids)
        .update_all status: self.class.statuses[:completed]
      
      # mark for index
      company_user_answers_scope
        .where(id: not_completed_answer_ids)
        .update_all status: self.class.statuses[:for_index]
        
      company.recalc_index(true)
      company.save!
    elsif answers_count > SurveyQuestion::COUNT
      raise "issue with callback. Company_id: #{company_id}, answer_id: #{id}"
    end
  end
end
