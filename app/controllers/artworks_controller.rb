class ArtworksController < ApplicationController
  before_action :authenticate_user!

  def index
    @artworks = Artwork.all
  end

  def new
    @artwork = Artwork.new
  end

  def create
    @artwork = Artwork.create!(artwork_params)
    if @artwork.save
      redirect_to artworks_path
    else
      render :new
    end
  end

  def edit
    @artwork = Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.update(artwork_params)
  end

  private

  def artwork_params
     params.require(:artwork).permit(:user_id, :name, :description, :price, :technique, artwork_attachments_attributes: [:id, :artwork_id, :picture])
  end
end
