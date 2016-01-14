class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name, use: :slugged
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable
         
  acts_as_ordered_taggable_on :skills, :roles, :services
  
  has_one  :investing,   dependent: :delete
  has_many :experiences, dependent: :delete_all
  has_many :companies,   dependent: :destroy
  accepts_nested_attributes_for :investing, :experiences, allow_destroy: true
         
  validates :first_name, :last_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :username, length: {minimum: 2, maximum: 50}, allow_blank: true
  
  # optional fields
  validates :country, :city,
    :gplay_link, :itunes_link, :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link, :website, 
    length: {maximum: 255}, allow_blank: true
    
  validates :about, :short_resume, :what_do, length: {maximum: 500}, allow_blank: true
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover,  CoverUploader
  
  # extend helper to update only assocition unless id specified
  def investing_attributes=(v)
    unless v.is_a?(Hash)
      super
      return
    end
    
    super v.merge(id: investing.try(:id))
  end
  
  def preload_and_prebuild_associations
    ActiveRecord::Associations::Preloader.new.preload \
      self, [:investing, :experiences]
      
    investing || build_investing
  end
  
  # permalink and in email
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
end
