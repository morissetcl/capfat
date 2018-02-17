RSpec.shared_examples 'fill_form' do |model, options|
  obj = model.to_s
  my_model = obj.capitalize.constantize
  it "créer un(e) #{obj}" do
    check_object obj
    expect {
      options.each do | option|
        fill_in "#{obj}_#{option.first}".to_sym, with: option.last
      end
      find('[name=commit]').click
    }.to change { my_model.count }
  end
  def check_object obj
    if obj == 'user'
      visit send("new_#{obj}_registration_path")
    else
      visit send("new_#{obj}_path")
    end
  end
end
