class UserSerializer < ActiveModel::Serializer
  attributes \
    :id,               :first_name,   :last_name,        :username, :country, :city, 
    :avatar_thumb_url, :avatar_url,   :cover_url,
    :rating,           :trend,        :followings_count, :followers_count, 
    :gplay_link,       :itunes_link,  :dribbble_link,    :fb_link,  :gh_link, :gplus_link, 
    :linkedin_link,    :twitter_link, :youtube_link,     :website,
    :about,            :short_resume, :what_do,
    :role_list,        :skill_list,   :service_list
    
    has_one  :investing
    has_many :experiences
end
