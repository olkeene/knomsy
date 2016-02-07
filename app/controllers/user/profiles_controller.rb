require 'ability'

class User::ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user!, only: [:show]
  
  def show
    @serialized_user  = UserSerializer.new(@user)

    gon.user             = @serialized_user
    gon.experience_roles = Experience.roles.map{|role, v| {value: role, name: role.humanize} }
    gon.can_edit_user    = Ability.new(current_user).can?(:edit, @user)
  end

  def update
    if current_user.update(permitted_params[:user] || {})
      render_notice UserSerializer.new(current_user)
    else
      render_error current_user.errors.to_a
    end
  end
  
  private
  
  def find_user!
    @user = User.where(slug: params[:id]).first!.decorate
    @user.preload_and_prebuild_associations
    @user
  end
  
  def permitted_params
    params.permit(user: [
      :first_name,    :last_name,    :username,      :country_id, :city, 
      :avatar,        :cover,        :remove_avatar, :remove_cover,
      :gplay_link,    :itunes_link,  :dribbble_link, :fb_link,    :gh_link, :gplus_link, 
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
