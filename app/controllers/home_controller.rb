# Public pages, login not required
class HomeController < ApplicationController
  def index
    redirect_to profile_path(current_user) if signed_in?
  end
end
