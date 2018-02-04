require "rails_helper"

RSpec.describe 'Admin - Artwork - Show', :feature do
  let!(:admin_user) { create :admin_user }

  before :each do
    visit new_admin_user_session_path
    fill_in "admin_user_email".to_sym, with: admin_user.email
    fill_in "admin_user_password".to_sym, with: "password"
    click_on "Login"
  end

  it "display the artwork and its picture" do
    user = create :user, email: 'dodo@email.fr'
    artwork = create :artwork, name: "L'origine du monde", price: 20, user: user
    attachment = create :artwork_attachment, artwork: artwork
    visit admin_artwork_path artwork
    expect(page).to have_content artwork.name
    expect(page).to have_content artwork.user.email
    expect(page).to have_content artwork.price
    expect(page).to have_content attachment.picture_url
  end
end
