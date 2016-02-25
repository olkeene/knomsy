class User::DashboardsController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @serialized_companies = ActiveModel::ArraySerializer.new \
      current_user.companies, each_serializer: CompanySerializer
  end
end
