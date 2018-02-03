require 'rails_helper'

RSpec.describe 'Admin - Artwork - Edit', :feature do
  let!(:admin_user) { create :admin_user }

  before :each do
    visit new_admin_user_session_path
    fill_in 'admin_user_email'.to_sym, with: admin_user.email
    fill_in 'admin_user_password'.to_sym, with: 'password'
    click_on 'Login'
  end

  it 'Edit an artwork' do
    artwork = create :artwork
    visit edit_admin_artwork_path artwork
    fill_in :artwork_name, with: 'Dany Dan le maniac'
    click_on 'Update Artwork'
    expect(artwork.reload.name).to eq 'Dany Dan le maniac'
  end
end
