require "rails_helper"

RSpec.describe "home", :feature do

  before :each do
    login_as_user
  end

  it "affiche la home" do
    visit "/"
    expect(page).to have_content ""
  end
end
