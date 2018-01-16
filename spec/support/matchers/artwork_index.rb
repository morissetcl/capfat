RSpec::Matchers.define :artwork_index_page do |model|
  match_unless_raises do |page|
    expect(page).to have_content model.name
    expect(page).to have_content model.description
    expect(page).to have_content model.description
  end
end
