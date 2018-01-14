class ArtworksController < ApplicationController
  before_action :authenticate_user!
  def index
    @artworks = Artwork.all
  end
end
