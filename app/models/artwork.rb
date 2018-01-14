class Artwork < ApplicationRecord
  belongs_to :user
  validates :name, :price, :description, presence: true
  delegate :email, to: :user
end
