# Public pages, login not required
class User::DashboardsController < ApplicationController
  def show
    @companies = current_user.companies
  end
end
