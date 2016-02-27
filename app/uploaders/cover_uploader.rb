# encoding: utf-8

class CoverUploader < BaseImageUploader
  def default_url
    ActionController::Base.helpers.asset_path 'defaults/cover.jpg'
  end
end
