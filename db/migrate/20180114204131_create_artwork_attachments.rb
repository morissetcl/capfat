class CreateArtworkAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :artwork_attachments do |t|
      t.references :artwork, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
