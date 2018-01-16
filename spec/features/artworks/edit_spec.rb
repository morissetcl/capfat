require "rails_helper"

RSpec.describe "Artwork#edit", :feature do

  include_context 'login'

  it 'editer une oeuvre' do
    artwork = create :artwork
    visit edit_artwork_path artwork
    fill_in :artwork_name, with: 'Sisi La Famille'
    click_on 'Update Artwork'
    artwork.reload
    expect(artwork.name).to eq 'Sisi La Famille'
  end
end
