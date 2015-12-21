class User::ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def show
  end

  def update
    if current_user.update(permitted_params[:user])
      render_notice UserSerializer.new(current_user)
    else
      render_error current_user.errors.to_a
    end
  end
  
  private
  
  def permitted_params
    params.permit(user: [
      :first_name,    :last_name,    :name,             :username,        :avatar,  :cover, :country, :city, 
      :rating,        :trend,        :followings_count, :followers_count, :cover_url,
      :gplay_link,    :itunes_link,  :dribbble_link,    :fb_link,         :gh_link, :gplus_link, 
      :linkedin_link, :twitter_link, :youtube_link,     :website,
      :about,         :short_resume, :what_do,
      :role_list,     :skill_list,   :service_list
    ])
  end
end