class Company::QuestionsController < Company::BaseController
  def next
    question = SurveyQuestion.left_for(current_user, @company, params[:skip_id]).first
    question = question.decorate(context: {company: @company}) if question
    
    render json: question
  end
end
