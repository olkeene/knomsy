require 'index_calc'

class Company < ActiveRecord::Base
  extend FriendlyId
  friendly_id :short_name, use: :slugged
  
  Artifact::Accessors.init(self, :role)
  
  belongs_to :user,    required: true
  belongs_to :country, required: true
  belongs_to :category
  
  has_many :survey_answers, dependent: :delete_all
  has_many :members,  class_name: :CompanyUser,    dependent: :delete_all
  has_many :fundings, class_name: :CompanyFunding, dependent: :delete_all
  accepts_nested_attributes_for :members, :fundings, allow_destroy: true
  
  validates :name, :short_name, presence: true, length: {minimum: 2, maximum: 50}
  validates :description, length: {maximum: 500}
  
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
  
  before_save :recalc_index
  
  def founded_on=(v)
    return if v.blank?
    
    begin
      write_attribute :founded_on, Date.strptime(v, '%m/%d/%Y')
    rescue ArgumentError
      super(v)
    end
  end
  
  def owner?(test_user)
    user_id == test_user.id
  end
  
  def location
    [country_name, city].compact.join(', ')
  end
  
  def followings_count
    142
  end
  
  def followers_count
    21
  end
  
  def progress
    Random.new.rand(1..99)
  end
  
  def country_name
    country_id and country.name
  end
  
  def category_list=(v)
    mapping = (v || '').split(',').map(&:strip)
    self.category_ids = Category.where(name: mapping).pluck(:id)
  end
  
  def categories
    Category.where(id: category_ids)
  end
  
  def category_list
    categories.pluck(:name)
  end
  
  def to_param
    slug
  end
  
  def recalc_index(force = false)
    if force || (country_id_changed? || category_ids_changed?)
      new_rating = IndexCal.new(self).calc
      
      self.rating_trend = (new_rating - (rating || 0))
      self.rating       = new_rating
    end
  end
end
