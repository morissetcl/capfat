require "rails_helper"

RSpec.describe "Artwork#index", :feature do
  attr_reader :artwork
  before :each do
    @artwork = create :artwork
  end
  it 'affiche la liste des oeuvres' do
    visit artworks_path
    expect(page).to artwork_index_page(artwork)
  end
end
