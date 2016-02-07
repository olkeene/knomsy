require 'ability'

class User::CompaniesController < ApplicationController
  before_action :authenticate_user!,   except: :show
  
  before_action :find_scoped_company!, only: [:update]
  before_action :find_company!,        only: [:show]
  
  before_action :build_company,        only: [:new, :create]
  
  def show
    @serialized_company  = CompanySerializer.new(@company)

    gon.company          = @serialized_company
    gon.people_roles     = CompanyUser.humanized_roles
    gon.funding_rounds   = CompanyFunding.humanized_rounds
    gon.can_edit_company = Ability.new(current_user).can?(:edit, @company)
  end

  def new
  end
  
  def create
    if @company.save
      redirect_to @company
    else
      render :new
    end
  end
  
  def update
    if @company.update(permitted_params[:company] || {})
      render_notice CompanySerializer.new(@company)
    else
      render_error @company.errors.to_a
    end
  end
  
  private
  
  def find_company!
    @company = Company.with_associations.friendly.find(params[:id])
  end
  
  def find_scoped_company!
    @company = current_user.companies.with_associations.friendly.find(params[:id])
  end
  
  def permitted_params
    params.permit(company: [
      :name, :short_desc, 
      :country_id, :city, :market, :category_id, :short_name, :terms_of_service,
      :founded_on,
      :logo,          :cover,        :remove_logo,   :remove_cover,
      :description,   :role_list,
      :gplay_link,    :itunes_link,  :dribbble_link, :fb_link, :gh_link, :gplus_link, 
      :linkedin_link, :twitter_link, :youtube_link,  :website,
      members_attributes:  [:id, :_destroy, :name, :role, :title],
      fundings_attributes: [:id, :_destroy, :round, :funded_on, :amount, :investor_list, :link, :visible]
    ])
  end
  
  def build_company
    @company = current_user.companies.build(permitted_params[:company])
  end
end
