ActiveAdmin.register User do
  permit_params :street, :city, :zip_code, :email, :password, :password_confirmation

  form title: 'Ajouter un nouvel utilisateur' do |f|
    inputs 'Details' do
      input :email
      input :street
      input :city
      input :zip_code
      input :password
      input :password_confirmation
    end
    actions
  end
end
