# frozen_string_literal: true

ActiveAdmin.register ArtworkAttachment do
  actions :all, except: [:show]
  belongs_to :artwork

  permit_params :id, :picture
end
