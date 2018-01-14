RSpec::Matchers.define :artwork_index_page do |artwork|
  match_unless_raises do |page|
    expect(page).to have_content artwork.name
    expect(page).to have_content artwork.description
    expect(page).to have_content artwork.description
  end
end
