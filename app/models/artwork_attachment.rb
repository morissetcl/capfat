class ArtworkAttachment < ApplicationRecord
  mount_uploader :picture, PictureUploader
  belongs_to :artwork
  validates :picture, presence: true
end
