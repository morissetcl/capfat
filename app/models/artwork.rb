class Artwork < ApplicationRecord
  belongs_to :user
  validates :name, :price, :description, :technique, presence: true
  delegate :email, to: :user
end
