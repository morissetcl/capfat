require "rails_helper"

RSpec.describe "home", :feature do
  it "renders _event partial for each event" do
    visit "/"
    expect(page).to_have content "vou"
  end
end
