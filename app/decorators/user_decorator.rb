class UserDecorator < Draper::Decorator
  delegate_all

  def profile_styles
    return unless false
    
    {background: object.cover.url}
  end
end
