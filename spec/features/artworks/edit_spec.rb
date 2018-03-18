require "rails_helper"

RSpec.describe "Artwork#edit", :feature do
  let!(:user) { create :user }

  before :each do
    sign_in_as(user)
  end

  it 'editer une oeuvre' do
    artwork = create :artwork, user: user
    visit edit_artwork_path artwork
    fill_in :artwork_name, with: 'Sisi La Famille'
    click_on 'Update Artwork'
    artwork.reload
    expect(artwork.name).to eq 'Sisi La Famille'
    expect(artwork.price).to eq 'Dany Dan le maniac'
  end
end
