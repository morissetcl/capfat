class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave unless Rails.env.test?

end
