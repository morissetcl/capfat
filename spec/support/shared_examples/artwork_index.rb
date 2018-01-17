RSpec.shared_examples_for 'artwork_index_page' do |model|
  it 'affiche la liste des oeuvres' do
    resource = create model
    path = model.to_s
    visit("/#{path}s")
    expect(page).to have_content resource.name
    expect(page).to have_content resource.description
    expect(page).to have_content resource.description
  end
end
