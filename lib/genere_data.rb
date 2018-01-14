require 'faker'

class GenereData < ApplicationRecord
  def self.users
    3.times do
      User.create(
        email: Faker::Internet.email,
        password: 'password'
      )
    end
  end

  def self.artworks
    10.times do
      Artwork.create(
        name: Faker::Zelda.character,
        description: Faker::Lorem.paragraph,
        price: Faker::Number.between(5, 20),
        user: User.all.sample
      )
    end
  end
end
