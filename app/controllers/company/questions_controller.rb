class Company::QuestionsController < Company::BaseController
  def next
    question = if Ability.new(current_user).can?(:took_survey, @company)
      q = SurveyQuestion.left_for(current_user, @company, params[:skip_id]).first
      q = q.decorate(context: {company: @company}) if q
    end
    
    render json: question
  end
end
