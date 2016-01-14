# encoding: utf-8

class LogoUploader < ImageUploader
  process eager: true
  process resize_to_fill: [140, 140, :north]  
end
