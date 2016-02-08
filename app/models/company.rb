class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_name, use: :slugged
  
  Artifact::Accessors.init(self, :role)
  
  belongs_to :country
  belongs_to :category
  
  has_many :members,  class_name: :CompanyUser,    dependent: :delete_all
  has_many :fundings, class_name: :CompanyFunding, dependent: :delete_all
  accepts_nested_attributes_for :members, :fundings, allow_destroy: true
  
  validates :name, :short_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, length: {maximum: 500}
  
  validates :country_id, presence: true
  validates :city, :market, length: {maximum: 255}, presence: true
  
  validates \
    :gplay_link,    :itunes_link,  :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link,  :website, 
    length: {maximum: 255}, allow_blank: true
  
  validate do
    errors.add :category_list, 'should have at least 1 assigned category' if category_list.blank?
  end

  validates_acceptance_of :terms_of_service, on: :create
  
  mount_uploader :logo,  LogoUploader
  mount_uploader :cover, CoverUploader
  
  scope :with_associations, ->{ includes(:country, :category) }
  
  #TODO deal with category, country, city and market fields, Make it as associations or scoped tags
  
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
  
  def country_name
    country_id and country.name
  end
  
  def category_list=(v)
    mapping = (v || '').split(',').map(&:strip)
    self.category_ids = Category.where(name: mapping).pluck(:id)
  end
  
  def category_list
    Category.where(id: category_ids).pluck(:name)
  end
  
  def to_param
    slug
  end
end
