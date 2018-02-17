class Artwork < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  validates :name, :price, :description, :technique, presence: true

  has_many :artwork_attachments, inverse_of: :artwork, dependent: :destroy
  belongs_to :user

  accepts_nested_attributes_for :artwork_attachments, reject_if: :all_blank, allow_destroy: true

  delegate :email, to: :user
end
