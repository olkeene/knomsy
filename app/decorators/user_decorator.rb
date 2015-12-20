class UserDecorator < Draper::Decorator
  delegate_all
  
  def name
    "#{first_name} #{last_name}"
  end
  
  def location?
    [country, city].any?{|v| !v.blank? }
  end
  
  def location
    return unless location?
    
    [country, city].reject(&:blank?).join(', ')
  end
  
  def cover_url
    # return unless cover
    
    # cover.url
    'http://v1.knomsy.com/assets/profile-header__background-gRrlhVu.jpg'
  end
end
