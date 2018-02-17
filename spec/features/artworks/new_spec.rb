require "rails_helper"

RSpec.describe "Artwork#new", :feature do
  let!(:user) { create :user }

  before :each do
    sign_in_as(user)
  end

  it_behaves_like 'fill_form', :artwork, options = { name: 'Mon oeuvre',
                                  description: 'Lorem lorem lorem lorem',
                                  technique: 'Spray',
                                  price: 12.9
                                }
end
