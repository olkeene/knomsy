class CompanyUser < ActiveRecord::Base
  enum role: [:founder, :investor, :employee]
  
  belongs_to :company
  
  validates :company_id, :role, presence: true
  validates :name,  length: {minimum: 2, maximum: 100}
  validates :title, length: {minimum: 2, maximum: 50}
  
  def avatar_url
    'https://placehold.it/70x70'
  end
end
