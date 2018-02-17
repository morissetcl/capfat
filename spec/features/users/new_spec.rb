require "rails_helper"

RSpec.describe "User#new", :feature do

  it_behaves_like 'fill_form', :user, options = { email: 'user@example.com',
                                  password: 'password',
                                  password_confirmation: 'password'
                                }
end
