require 'ability'

class Company::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :find_company!
  
  respond_to :json
  
  rescue_from Ability::AccessDeny do |exception|
    render_notice '' # blank object
  end
  
  private
  
  def find_company!
    @company = Company.friendly.find(params[:company_id] || params[:id])
  end
  
  def can_vote!
    unless Ability.new(current_user).can?(:took_survey, @company)
      raise Ability::AccessDeny
    end
  end 
end
