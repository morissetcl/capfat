require "rails_helper"

RSpec.describe 'home', :feature do
  let!(:user) { create :user }

  it "affiche la home" do
    visit root_path
    expect(page).to have_content ""
  end
end
