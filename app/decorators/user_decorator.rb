class UserDecorator < Draper::Decorator
  delegate_all
  
  def cover_url
    # return unless cover
    
    # cover.url
    'http://v1.knomsy.com/assets/profile-header__background-gRrlhVu.jpg'
  end
end
