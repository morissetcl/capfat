require "rails_helper"

RSpec.describe "Artwork#edit", :feature do
  let!(:user) { create :user }

  before :each do
    visit new_user_session_path
    fill_in "user_email".to_sym, with: User.last.email
    fill_in "user_password".to_sym, with: "password"
    click_on "Log in"
  end

  it 'editer une oeuvre' do
    artwork = create :artwork
    visit edit_artwork_path artwork
    fill_in :artwork_name, with: 'Sisi La Famille'
    click_on 'Update Artwork'
    artwork.reload
    expect(artwork.name).to eq 'Sisi La Famille'
  end
end
