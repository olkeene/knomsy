# encoding: utf-8

class AvatarUploader < ImageUploader
  version :thumb do
    eager
    resize_to_fill 25, 25, :north
  end
  
  version :standard do
    eager
    resize_to_fill 140, 140, :north
  end
end
