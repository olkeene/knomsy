# Public pages, login not required
class User::DashboardsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @companies = current_user.companies
  end
end
