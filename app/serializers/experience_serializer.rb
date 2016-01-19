class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :role, :humanized_role, :title, :description, :started_at, :ended_at, :current
  
  def humanized_role
    object.role && object.role.humanize
  end
end
