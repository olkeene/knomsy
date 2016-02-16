class CompanyUser < ActiveRecord::Base
  enum role: [:founder, :investor, :employee]
  
  belongs_to :company, required: true
  
  validates :role, presence: true
  validates :name,  length: {minimum: 2, maximum: 100}
  validates :title, length: {minimum: 2, maximum: 50}
  
  class << self
    def humanized_roles
      roles.map do |role, v| 
        {value: role, name: role.humanize}
      end
    end
  end
  
  def avatar_url
    'https://placehold.it/70x70'
  end
end
