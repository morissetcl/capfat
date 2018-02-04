require "rails_helper"

RSpec.describe 'Admin - Artwork - New', :feature do
  let!(:admin_user) { create :admin_user }

  before :each do
    visit new_admin_user_session_path
    fill_in "admin_user_email".to_sym, with: admin_user.email
    fill_in "admin_user_password".to_sym, with: "password"
    click_on "Login"
  end

  it "Create a new artwork" do
    create :user, email: 'pablo@picasso.fr'
    visit new_admin_artwork_path
    expect {
      select 'pablo@picasso.fr', from: :artwork_user_id
      fill_in :artwork_name, with: 'Joconde'
      fill_in :artwork_description, with: 'Lorem ipsum description'
      fill_in :artwork_technique, with: 'Spray paint'
      fill_in :artwork_price, with: 12
      click_on 'Create Artwork'
    }.to change{ Artwork.count }
  end
end
