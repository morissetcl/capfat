require "rails_helper"

RSpec.describe 'home', :feature do
  let!(:user) { create :user }

  before :each do
    visit new_user_session_path
    fill_in "user_email".to_sym, with: User.last.email
    fill_in "user_password".to_sym, with: "password"
    click_on "Log in"
  end

  it "affiche la home" do
    visit root_path
    expect(page).to have_content ""
  end
end
