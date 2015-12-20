class UserSerializer < ActiveModel::Serializer
  attributes \
    :id,            :first_name,   :last_name,        :name,            :username, :about, :avatar, :cover, :country, :city, :location, 
    :rating,        :trend,        :followings_count, :followers_count, :cover_url,
    :gplay_link,    :itunes_link,  :dribbble_link,    :fb_link,         :gh_link,  :gplus_link, 
    :linkedin_link, :twitter_link, :youtube_link,     :website
end
