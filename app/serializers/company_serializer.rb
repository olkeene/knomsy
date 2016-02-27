class CompanySerializer < ActiveModel::Serializer
  attributes \
    :id,         :name,           :short_name,       :description, :short_desc, :founded_on,
    :country_id, :country_name,   :city,             :location,    :market,     :category_list,
    :rating,     :rating_trend,   :followings_count, :followers_count, 
    :logo_url,   :logo_thumb_url, :cover_url,
    
    :gplay_link,    :itunes_link,  :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link,  :website,
    :role_list,
    :progress
    
  has_many :members
  has_many :fundings
    
  def id
    object.to_param
  end
  
  def logo_thumb_url
    object.logo_url(:thumb)
  end
end
