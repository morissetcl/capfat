require "rails_helper"

RSpec.describe 'Admin - User - New', :feature do
  let!(:admin_user) { create :admin_user }

  before :each do
    visit new_admin_user_session_path
    fill_in "admin_user_email".to_sym, with: admin_user.email
    fill_in "admin_user_password".to_sym, with: "password"
    click_on "Login"
  end

  it "Create a new user" do
    visit new_admin_user_path
    expect {
      fill_in :user_email, with: 'hello@gmail.com'
      fill_in :user_street, with: '17 boulevard ornano'
      fill_in :user_city, with: 'Paris'
      fill_in :user_zip_code, with: '75018'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_on 'Create User'
    }.to change{ User.count }
    expect(User.last.reload.geocoded?).to be true
  end
end
