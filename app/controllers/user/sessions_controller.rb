class User::SessionsController < Devise::SessionsController
  protected
  
  def after_sign_in_path_for(resource)
    profile_path
  end
end
