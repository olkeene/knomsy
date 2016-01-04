class CompanyUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :role, :title, :humanized_role, :avatar_url
  
  def humanized_role
    object.role && object.role.humanize
  end
end
