RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = "spec/examples.txt"
  config.disable_monkey_patching!
  config.default_formatter = "doc" if config.files_to_run.one?
  config.order = :random
  Kernel.srand config.seed
  # config.profile_examples = 10
end

def model_validation(model)
  attribute = model.new.attributes.keys
  array = []
  attribute.each do |a|
    model.validators_on(a.to_sym).any? do |validator|
      return if presence_validation?(validator)
      array << a
      array.each do |a|
        it { should validate_presence_of(a) }
      end
    end
  end
end

def presence_validation?(validator)
  validator.kind_of?(ActiveModel::Validations::PresenceValidator)
end

def login_as_user
  visit new_user_session_path
  fill_in :user_email, with: 'email@email.fr'
  fill_in :user_password, with: 'password'
  click_on 'Log in'
end
