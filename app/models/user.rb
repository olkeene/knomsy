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
  validates :about, :country, :city,
    :gplay_link, :itunes_link, :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link, :website, 
    length: {maximum: 255}, allow_blank: true
    
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
end
