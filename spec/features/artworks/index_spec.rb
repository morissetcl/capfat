require "rails_helper"

RSpec.describe "Artwork#index", :feature, focus: true do

  include_context 'login'
  it_behaves_like 'artwork_index_page', :artwork
end
