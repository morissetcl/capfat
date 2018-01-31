require "rails_helper"

RSpec.describe 'Admin - Artwork', :feature do
  let!(:admin_user) { create :admin_user }

  before :each do
    visit new_admin_user_session_path
    fill_in "admin_user_email".to_sym, with: AdminUser.last.email
    fill_in "admin_user_password".to_sym, with: "password"
    click_on "Login"
  end

  it "display the list of artworks" do
    visit root_path
    expect(page).to have_content ""
  end
end
