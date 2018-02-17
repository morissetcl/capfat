require "rails_helper"

RSpec.describe "Artwork#show", :feature do

  it 'Show an artwork' do
    artwork = create :artwork
    visit artwork_path artwork
    expect(page).to have_content artwork.name
  end
end
