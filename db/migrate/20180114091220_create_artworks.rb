class CreateArtworks < ActiveRecord::Migration[5.1]
  def change
    create_table :artworks do |t|
      t.string :name
      t.string :description
      t.string :technique
      t.references :user, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
