class User::CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_company!, except: [:new, :create]
  before_action :build_company, only:   [:new, :create]
  
  def show
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
    if @company.update(permitted_params[:company])
      render_notice CompanySerializer.new(company)
    else
      render_error @company.errors.to_a
    end
  end
  
  # def destroy
  #   @company.destroy
  #   
  #   head :ok
  # end
  
  private
  
  def find_company!
    @company = current_user.companies.friendly.find(params[:id])
  end
  
  def permitted_params
    params.permit(company: [:name, :description, :country, :city, :market, :category, :short_name, :terms_of_service])
  end
  
  def build_company
    @company = current_user.companies.build(permitted_params[:company])
  end
end
