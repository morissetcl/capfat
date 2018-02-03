ActiveAdmin.register Artwork do
  permit_params :user_id, :name, :description, :technique, :price

  form title: 'Ajouter une nouvelle oeuvre' do |f|
    inputs 'Details' do
      input :user_id, as: :select, collection: User.pluck(:email, :id)
      input :name
      input :description
      input :technique
      input :price
    end
    actions
  end
end
