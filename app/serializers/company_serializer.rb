class CompanySerializer < ActiveModel::Serializer
  attributes \
    :id,            :name,         :short_name,       :description, :founded_on,
    :country,       :city,         :market,           :category,
    :rating,        :trend,        :followings_count, :followers_count, :logo_url, :cover_url,
    
    :gplay_link,    :itunes_link,  :dribbble_link, :fb_link, :gh_link, :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link,  :website,
    :tag_list
    
  has_many :members
  has_many :fundings
    
  def id
    object.to_param
  end
end
