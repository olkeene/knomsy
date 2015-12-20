class User::ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
    gon.user = UserSerializer.new(current_user)
  end

  def update
    if current_user.update(permitted_params[:user])
      render_notice current_user
    else
      render_error current_user.errors
    end
  end
  
  private
  
  def permitted_params
    params.permit(user: [:first_name, :last_name, :username, :about, :avatar, :cover, :country, :city,
      :gplay_link, :itunes_link, :dribbble_link, :fb_link, :gh_link, :gplus_link, 
      :linkedin_link, :twitter_link, :youtube_link, :website])
  end
end
