class ArtworksController < ApplicationController
  before_action :authenticate_user!

  def index
    @artworks = Artwork.all
  end

  def new
    @artwork = Artwork.new
    @artwork_attachment = @artwork.artwork_attachments.build
  end

  def create
    @artwork = Artwork.new(artwork_params)
    p @artwork
    if @artwork.save
      p  params[:artwork_attachments][:picture]
      params[:artwork_attachments][:picture].each do |a|
         @artwork_attachment = @artwork.artwork_attachments.create!(:picture => a, :artwork_id => @artwork.id)
      end
      p @artwork
      redirect_to artworks_path, notice: 'Artwork was successfully created.'
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
