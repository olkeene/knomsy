# encoding: utf-8

class LogoUploader < ImageUploader
  eager
  resize_to_fill 140, 140, :north
end
