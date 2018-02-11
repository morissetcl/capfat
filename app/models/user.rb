class User < ApplicationRecord
  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_address
    "#{street}, #{zip_code} #{city}"
  end
end
