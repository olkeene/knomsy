class Experience < ActiveRecord::Base
  enum role: [:founder, :investor, :employee, :education]
  
  belongs_to :user
  
  validates :user_id, :role, presence: true
  validates :company_name, :title, length: {maximum: 255}
  validates :description, length: {maximum: 500}, allow_blank: true
  validates :started_at, :ended_at, date: true
end
