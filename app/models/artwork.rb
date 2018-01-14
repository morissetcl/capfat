class Artwork < ApplicationRecord
  has_many :artwork_attachments
  accepts_nested_attributes_for :artwork_attachments
  belongs_to :user
  validates :name, :price, :description, :technique, presence: true
  delegate :email, to: :user
end
