# encoding: utf-8

class BaseUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  
  def public_id
    "#{model.class.to_s.underscore}_#{mounted_as}_#{model.id}"
  end 
end
