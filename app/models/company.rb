class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_name, use: :slugged
  
  validates :name, :short_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, length: {maximum: 500}
  validates :country, :city, :market, :category, presence: true

  validates_acceptance_of :terms_of_service, on: :create
  
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
end
