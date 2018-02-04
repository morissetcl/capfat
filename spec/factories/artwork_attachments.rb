FactoryBot.define do
  factory :artwork_attachment do
    artwork
    picture { File.new("#{Rails.root}/spec/fixtures/banner-min.jpg") }
  end
end
