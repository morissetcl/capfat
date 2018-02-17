require 'securerandom'

FactoryBot.define do
  factory :user do
    email "test-#{SecureRandom.hex}@example.com"
    password 'password'
  end
end
