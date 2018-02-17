class MarkersController < ApplicationController

  protected

  def index
    @users = User.where.not(latitude: nil, longitude: nil)
    marker_map(@users)
  end

  def show
    @user = Artwork.friendly.find(params[:id]).user
    marker_map(@user)
  end

  private

  def marker_map(marker)
    @markers = Gmaps4rails.build_markers(marker) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end
end
