class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  rescue_from ActiveRecord::RecordInvalid do |invalid|
    render_error invalid.record.errors.to_a
  end
  
  rescue_from ActiveRecord::RecordNotFound do |exception|
    render_error error: 'Record not found'
  end
  
  protected
  
  # overwrite to support decorator
  def current_user
    return @current_user if @current_user
    
    @current_user = super.decorate if super
    @current_user
  end
  
  def render_notice(txt, options = {})
    options.reverse_merge!({json: txt, status: :ok})
    render(options)
  end
  
  def render_error(txt, options = {})
    options.reverse_merge!({json: {errors: txt}, status: :ok})
    render(options)
  end
end
