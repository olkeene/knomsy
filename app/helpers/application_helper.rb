module ApplicationHelper
  def body_class
    return @body_class if defined?(@body_class)

    classes = [controller_name]
    classes << 'admin' if controller_path =~ /^admin/
    classes << controller_action

    classes.join(' ')
  end
  
  def non_signed_in_pages?
    %w(home confirmations passwords registrations sessions).include?(controller_name)
  end
  
  def container_class
    # nonsigned in 
    return 'text-center login-page' if non_signed_in_pages?
  end
  
  def container_sub_class
    # nonsigned in 
    return 'col-inline col-xs-12 col-sm-7 col-md-6 col-lg-5' if non_signed_in_pages?
  end

  def controller_action
    @controller_action ||= "#{controller_name}_#{action_name}"
  end
  
  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} alert-dismissible", role: 'alert') do
        concat(content_tag(:button, class: 'close', data: { dismiss: 'alert' }) do
          concat content_tag(:span, '&times;'.html_safe, 'aria-hidden' => true)
          concat content_tag(:span, 'Close', class: 'sr-only')
        end)
        concat message
      end)
    end
    nil
  end
  
  private
  
  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }[flash_type.to_sym] || flash_type.to_s
  end
end
