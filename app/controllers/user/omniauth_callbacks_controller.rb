class User::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    process_auth('Facebook')
  end
  
  def linkedin
    process_auth('LinkedIn')
  end
  
  def twitter
    process_auth('Twitter')
  end
  
  private
  
  def omniauth
    request.env['omniauth.auth']
  end
  
  def process_auth(provider)
    if omniauth
      user = User.find_or_create_with_omni(omniauth)
    end
    
    if user && user.persisted?
      sign_in_and_redirect user, event: :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: provider) if is_navigational_format?
    else
      redirect_to root_path, alert: 'Unable to login'
    end
  end
  
  # def omniauth_params
  #   request.env['omniauth.params']
  # end
  
  # def after_sign_in_path_for(resource)
  #   omniauth_params['redirect-uri'] || \
  #     session.delete(:previous_url) || \
  #       root_path
  # end
end
