class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged
  
  Artifact::Accessors.init(self, :skill, :role, :service)
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable,
         :omniauthable, omniauth_providers: [:facebook, :linkedin, :twitter]
  
  belongs_to :country
  
  has_one  :investing,   dependent: :delete
  has_many :experiences, dependent: :delete_all
  has_many :companies,   dependent: :destroy
  accepts_nested_attributes_for :investing, :experiences, allow_destroy: true
         
  validates :first_name, :last_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :username, length: {minimum: 2, maximum: 50}, allow_blank: true
  
  # optional fields
  # validates :country_id, allow_blank: true
  validates :city,
    :gplay_link, :itunes_link, :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link, :website, 
    length: {maximum: 255}, allow_blank: true
    
  validates :about, :short_resume, :what_do, length: {maximum: 500}, allow_blank: true
  
  mount_uploader :avatar, AvatarUploader
  mount_uploader :cover,  CoverUploader
  
  class << self
    def find_or_create_with_omni(auth_hash, options = {})
      user_email = case auth_hash.provider
                   when 'facebook', 'linkedin', 'twitter'
                     auth_hash.info.email
                   else
                     raise StandardError, "provider: #{auth_hash.provider}, auth_hash: #{auth_hash}"
                   end
  
      # email is blank if unverified
      unless user_email.present?
        user_email = (auth_hash.info.nickname.present? ? auth_hash.info.nickname : auth_hash.uid) << "@#{auth_hash.provider}.com"
      end
  
      user = where(email: user_email).first
      
      if user
        # update email for case when it was blank at signup then get it verified
        # always perform. update exist users or their changed info
        user.update_attributes!(email: user_email)
      else
        first_name = auth_hash.info.first_name || 'No Name'
        last_name  = auth_hash.info.last_name  || 'No Name'
  
        args = {email: user_email, first_name: first_name, last_name: last_name}
        user = new(args)
        user.password = user.password_confirmation = SecureRandom.hex(10)
        user.skip_confirmation!
        user.save!
      end
  
      user
    end
  end
  
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
  
  def country_name
    country_id and country_id != 0 and country.name # != 0 tmp fix
  end
  
  private
  
  def slug_candidates
    [username, name]
  end
end
