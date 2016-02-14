class Company::BaseController < ApplicationController
  before_action :authenticate_user!
  before_action :find_company!
  
  respond_to :json
  
  private
  
  def find_company!
    @company = Company.friendly.find(params[:company_id] || params[:id])
  end  
end
