require 'genere_data'

GenereData.users
GenereData.artworks
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?