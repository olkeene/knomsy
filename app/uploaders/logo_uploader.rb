# encoding: utf-8

class LogoUploader < ImageUploader
  eager
  resize_to_fill 140, 140, :north
  
  version :thumb do
    process resize_to_fill: [60, 60]
  end
  
  def default_url(*args)
    default = 'company_logo.jpg'
    ActionController::Base.helpers.asset_path('defaults/' + [version_name, default].compact.join('_'))
  end
end
