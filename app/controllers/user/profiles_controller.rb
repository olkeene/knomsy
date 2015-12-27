class User::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :preload_and_prebuild_associations
  
  def show
    # TODO only if page editable
    gon.experience_roles = Experience.roles.map{|role, v| {value: role, name: role.humanize} }
  end

  def update
    if current_user.update(permitted_params[:user])
      render_notice UserSerializer.new(current_user)
    else
      render_error current_user.errors.to_a
    end
  end
  
  private
  
  def preload_and_prebuild_associations
    current_user.preload_and_prebuild_associations
  end
  
  def permitted_params
    params.permit(user: [
      :first_name,    :last_name,    :username,      :avatar,  :cover,   :country, :city, 
      :cover_url,
      :gplay_link,    :itunes_link,  :dribbble_link, :fb_link, :gh_link, :gplus_link, 
      :linkedin_link, :twitter_link, :youtube_link,  :website,
      :about,         :short_resume, :what_do,
      :role_list,     :skill_list,   :service_list,
      investing_attributes: [
        :amount,      :deals_year,   :confirmed_deals, :visible,
        :market_list, :country_list, :currency_list
      ],
      experiences_attributes: [:_destroy, :id, :role, :company_name, :title, :description, :started_at, :ended_at, :current]
    ])
  end
end
