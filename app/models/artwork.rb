class Artwork < ApplicationRecord
  has_many :artwork_attachments, inverse_of: :artwork, dependent: :destroy
  accepts_nested_attributes_for :artwork_attachments, reject_if: :all_blank, allow_destroy: true
  belongs_to :user
  validates :name, :price, :description, :technique, presence: true
  delegate :email, to: :user
end
