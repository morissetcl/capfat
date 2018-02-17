class AddSlugToArtworks < ActiveRecord::Migration[5.1]
  def change
    add_column :artworks, :slug, :string
  end
end
