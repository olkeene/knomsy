class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_name, use: :slugged
  
  has_many :members, class_name: :CompanyUser, dependent: :delete_all
  accepts_nested_attributes_for :members, allow_destroy: true
  
  validates :name, :short_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, length: {maximum: 500}
  
  validates :country, :city, :market, :category, length: {maximum: 255}, presence: true
  
  validates \
    :gplay_link,    :itunes_link,  :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link,  :website, 
    length: {maximum: 255}, allow_blank: true

  validates_acceptance_of :terms_of_service, on: :create
  
  acts_as_ordered_taggable_on :tags
  
  #TODO deal with category, country, city and market fields, Make it as associations or scoped tags
  
  def cover_url
    # return unless cover
    
    # cover.url
    'http://v1.knomsy.com/assets/profile-header__background-gRrlhVu.jpg'
  end
  
  def logo_url
    'http://placehold.it/50x50'
  end
  
  def founded_on=(v)
    return if v.blank?
    
    begin
      write_attribute :founded_on, Date.strptime(v, '%m/%d/%Y')
    rescue ArgumentError
      super(v)
    end
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
  
  def to_param
    slug
  end
end
