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
    has_many :references
    
  def references
    all = [
      'Thinking of how to find adepts/team members yet not sure how to create the team and motivate them? With Knomsy it all becomes clear, structured simply put achievable.',
      'You are constantly getting barraged with investment proposals and are finding it increasingly difficult wade through the hundreds of projects and find the diamond in the rough? To investors we offers an innovative yet simple time saving solution.',
      'In order to generate traction one has to fully understand their market and intended user base. Wouldn\'t it be great if there was an innovative product that would took care of this from the start?',
      'Are you having trouble putting together a clear picture of what investors are looking for? Knomsy has a solution for that.',
      'Thinking of how to find adepts/team members yet not sure how to create the team and motivate them? With Knomsy it all becomes clear, structured simply put achievable.',
      'You are constantly getting barraged with investment proposals and are finding it increasingly difficult wade through the hundreds of projects and find the diamond in the rough? To investors we offers an innovative yet simple time saving solution.',
      'In order to generate traction one has to fully understand their market and intended user base. Wouldn\'t it be great if there was an innovative product that would took care of this from the start?',
      'Knomsy has now moved forward to automated data analyses and processing as well as index calculation. The tech part of the project is being developed by using the most advanced programing technologies. In the nearest future we are planning to announce the beta release version for testing. We will also be connecting the second part of our data processing which is run through accessory influence.'
    ]
    
    all.sample(rand(2) + 1).map{|h| 
      {
        content: h, 
        user_name:    'Denis Kozminikh',
        user_image_url: 'http://knomsy.com/assets/landing/team/team-1-977563e716b16ac4ada5ae10679e8ffd.png',
        company_name: 'Knomsy',
        description:  'Startup eco system'
      } 
    }
  end
end
