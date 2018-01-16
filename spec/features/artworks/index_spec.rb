require "rails_helper"

RSpec.describe "Artwork#index", :feature do

  include_context 'login'

  it 'affiche la liste des oeuvres', :focus do
    artwork = create :artwork
    visit artworks_path
    expect(page).to artwork_index_page(artwork)
  end
end
