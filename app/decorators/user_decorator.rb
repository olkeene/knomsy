class UserDecorator < Draper::Decorator
  delegate_all
  
  def avatar_thumb_url
    @avatar_thumb_url ||= object.avatar_url && object.avatar_url(:thumb)
  end
  
  def avatar_url
    @avatar_url ||= object.avatar_url && object.avatar_url(:standard)
  end
end
