class CompanySerializer < ActiveModel::Serializer
  attributes \
    :id,            :name,         :short_name,       :description, :founded_on,
    :country,       :city,         :market,           :category,
    :rating,        :trend,        :followings_count, :followers_count, :logo_url, :cover_url,
    :linkedin_link, :twitter_link, :fb_link,          :website
    
  def id
    object.to_param
  end
end
