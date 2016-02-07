# Public pages, login not required
class DataController < ApplicationController
  respond_to :json
  
  def categories
    render json: Category.for_autocomplete.query(params[:query]).all
  end
  
  def countries
    render json: Country.for_autocomplete.query(params[:query]).all
  end
  
  def roles
    render json: Artifact.roles.limit(10)
  end
  
  def skills
    render json: Artifact.skills.limit(10)
  end
  
  def services
    render json: Artifact.services.limit(10)
  end
end
