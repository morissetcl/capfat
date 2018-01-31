def sign_in_as(user)
  utilisateur = user.class.name.to_s.downcase
  visit send("new_#{utilisateur}_session_path")
  fill_in "#{utilisateur}_email".to_sym, with: "email-#{User.count}@email.fr"
  fill_in "#{utilisateur}_password".to_sym, with: "password"
  click_on "Log in"
end
