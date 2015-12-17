class User::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters
  
  protected

  def configure_permitted_parameters
    # auto assign
    params[resource_name][:password_confirmation] = params[resource_name][:password]
    
    devise_parameter_sanitizer.for(:sign_up) do |u|
      u.permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
    # devise_parameter_sanitizer.for(:account_update) do |u|
    #   u.permit(:name, :email, :password, :password_confirmation, :current_password)
    # end
  end
end
