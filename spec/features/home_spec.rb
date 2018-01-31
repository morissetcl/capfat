require "rails_helper"

RSpec.describe 'home', :feature do

  include_context 'login'

  it "affiche la home" do
    visit root_path
    expect(page).to have_content ""
  end
end
