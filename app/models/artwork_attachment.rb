class ArtworkAttachment < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :artwork
end
