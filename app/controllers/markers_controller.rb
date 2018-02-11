class MarkersController < ApplicationController

  protected

  def index
    marker_map(@users)
  end

  def show
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
