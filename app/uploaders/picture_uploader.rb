class PictureUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave unless Rails.env.test?
  storage :file
    # storage :fog

    # Override the directory where uploaded files will be stored.
    # This is a sensible default for uploaders that are meant to be mounted:
    def store_dir
      "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
    end
end
