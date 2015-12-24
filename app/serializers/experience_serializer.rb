class ExperienceSerializer < ActiveModel::Serializer
  attributes :id, :company_name, :role, :title, :description, :started_at, :ended_at
end
