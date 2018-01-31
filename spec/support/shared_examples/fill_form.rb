RSpec.shared_examples 'fill_form' do |model, options|
  obj = model.to_s
  my_model = obj.capitalize.constantize
  it "créer un(e) #{obj}" do
    visit send("new_#{obj}_path")
    expect {
      options.each do | option|
        fill_in "#{obj}_#{option.first}".to_sym, with: option.last
      end
      click_on "Create #{my_model}"
    }.to change { my_model.count }
  end
end
