require "rails_helper"

RSpec.describe "Artwork#index", :feature do
  attr_reader :artwork

  before(:each) { @artwork = create :artwork }

  it "display all artworks", :focus do
    visit artworks_path
    expect(page).to have_content artwork.email
    expect(page).to have_content artwork.name
  end
end
