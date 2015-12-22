class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable
         
  validates :first_name, :last_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :username, length: {minimum: 2, maximum: 50}
  
  # optional fields
  validates :country, :city,
    :gplay_link, :itunes_link, :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link, :website, 
    length: {maximum: 255}, allow_blank: true
    
  validates :about, :short_resume, :what_do, length: {maximum: 500}, allow_blank: true
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def cover_url=(v)
    'TODO'
  end
    
  def rating
    2
  end
  
  def trend
    9
  end
  
  def followings_count
    142
  end
  
  def followers_count
    21
  end
  
  def role_list
    %w(admin mentor)
  end
  
  def role_list=(v)
    'todo'
  end
  
  def skill_list
    %w(ruby rails)
  end
  
  def skill_list=(v)
    'todo'
  end
  
  def service_list
    %w(enterprise startup)
  end
  
  def service_list=(v)
    'todo'
  end
end
