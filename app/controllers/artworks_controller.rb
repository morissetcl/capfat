class ArtworksController < ApplicationController
  before_action :authenticate_user!

  def index
    @artworks = Artwork.all
  end

  def new
    @artwork = Artwork.new
  end

  private
  def artwork_params
     params.require(:artwork).permit(:name, :description, :price, :technique, artwork_attachments_attributes: [:id, :artwork_id, :picture])
  end
end
