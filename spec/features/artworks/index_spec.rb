require "rails_helper"

RSpec.describe "Artwork#index", :feature do
  
  it_behaves_like 'artwork_index_page', :artwork
end
