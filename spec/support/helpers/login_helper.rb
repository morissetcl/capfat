def login_as_user
  visit new_user_registration_path
  fill_in :user_email, with: 'email@email.fr'
  fill_in :user_password, with: 'password'
  fill_in :user_password_confirmation, with: 'password'
  click_on 'Sign up'
end
