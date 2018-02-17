
def sign_in_as(user)
  utilisateur = user.class.name.to_s.downcase
  visit send("new_#{utilisateur}_session_path")
  fill_in "#{utilisateur}_email".to_sym, with: user.email
  fill_in "#{utilisateur}_password".to_sym, with: "password"
  click_on "Go !"
end
