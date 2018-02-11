class ArtworksController < ApplicationController
  def index
    @artworks = Artwork.all
    fresh_when(@artworks)
  end

  def new
    @artwork = Artwork.new
  end

  def show
    @artwork = Artwork.find(params[:id])
    @user = Artwork.find(params[:id]).user
    @artwork_marker = Gmaps4rails.build_markers(@user) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
    fresh_when [@artwork, @user]
  end

  def create
    @artwork = Artwork.new(artwork_params)
    if @artwork.save
      redirect_to artworks_path, notice: 'Votre oeuvre a été ajouté !'
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
     params.require(:artwork).permit(:user_id, :name, :description, :price, :technique, artwork_attachments_attributes: [:id, :picture, :_destroy, :picture_cache])
  end
end
