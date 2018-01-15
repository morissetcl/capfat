require "rails_helper"

RSpec.describe "Artwork#new", :feature do

  before :each do
    login_as_user
  end

  it 'ajoute une nouvelle oeuvre', :focus do
    visit new_artwork_path
    expect(page).to have_content 'Ajouter une nouvelle oeuvre'
     expect {
       fill_in :artwork_name, with: 'Mon oeuvre'
       fill_in :artwork_description, with: 'Lorem lorem lorem lorem'
       fill_in :artwork_technique, with: 'Spray'
       fill_in :artwork_price, with: 12.9
       click_on 'Create Artwork'
     }.to change { Artwork.count }.by(1)

  end
end
