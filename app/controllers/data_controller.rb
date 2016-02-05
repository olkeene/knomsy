# Public pages, login not required
class DataController < ApplicationController
  respond_to :json
  
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
