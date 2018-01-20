require "rails_helper"

RSpec.describe "Artwork#new", :feature do

  include_context 'login'
  it_behaves_like 'fill_form', :artwork, options = { name: 'Mon oeuvre',
                                  description: 'Lorem lorem lorem lorem',
                                  technique: 'Spray',
                                  price: 12.9
                                }
end
