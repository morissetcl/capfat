require "rails_helper"

RSpec.describe 'Admin - Artwork - Show', :feature do
  let!(:admin_user) { create :admin_user }

  before :each do
    visit new_admin_user_session_path
    fill_in "admin_user_email".to_sym, with: admin_user.email
    fill_in "admin_user_password".to_sym, with: "password"
    click_on "Login"
  end

  it "display the artwork" do
    artwork = create :artwork, name: "L'origine du monde", price: 20
    visit admin_artwork_path artwork
    expect(page).to have_content "L'origine du monde"
    expect(page).to have_content 20
  end
end
