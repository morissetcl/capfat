ActiveAdmin.register Artwork do
  permit_params :user_id, :name, :description, :technique, :price,
                artwork_attachments_attributes: %i[id picture]

  form title: 'Ajouter une nouvelle oeuvre' do |f|
    inputs 'Details' do
      input :user_id, as: :select, collection: User.pluck(:email, :id)
      input :name
      input :description
      input :technique
      input :price
    end
    f.has_many :artwork_attachments do |attach|
      if attach.object.picture_url.present?
        attach.input :picture, hint: image_tag(attach.object.picture_url)
      else
        attach.input :picture
      end
    end
    actions
  end

  show do
    attributes_table do
      row :user do |user|
        user.email
      end
      row :name
      row :description
      row :technique
      row :price
    end
    panel "Photos" do
     table_for artwork.artwork_attachments do
       column :picture do |p|
         image_tag p.picture_url
       end
     end
   end
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end
end
