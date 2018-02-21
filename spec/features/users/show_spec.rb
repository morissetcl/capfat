require "rails_helper"

RSpec.describe "User#show", :feature do
  let!(:user) { create :user }
  let!(:artwork) { create :artwork, user: user, name: 'super artwork' }
  let!(:artwork_attachment) { create :artwork_attachment, artwork: artwork }
  before :each do
    sign_in_as(user)
  end

  it 'show an user' do
    visit user_path user
    expect(page).to have_content user.email
    expect(page).to have_content artwork.name
    expect(page).to have_content artwork_attachment.picture
  end
end
