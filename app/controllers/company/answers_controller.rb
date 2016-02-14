class Company::AnswersController < Company::BaseController
  before_action :can_vote!
  before_action :find_question!
  
  def create
    scope = @question.answers.company_user_not_completed(@company, current_user)
    
    answer = if scope.exists?
      scope.first!
    else
      scope.build(permitted_params[:answer] || {})
    end
    
    if answer.save
      render_notice answer
    else
      render_error answer.errors.to_a
    end
  end
  
  private
  
  def find_question!
    @question = SurveyQuestion.find(params[:question_id])
  end
  
  def permitted_params
    params.permit(answer: [:q, :answer_type])
  end
end
