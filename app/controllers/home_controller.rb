class HomeController < ApplicationController
  def index
    @users = User.where.not(latitude: nil, longitude: nil)
    @markers = Gmaps4rails.build_markers(@users) do |user, marker|
      marker.lat user.latitude
      marker.lng user.longitude
    end
  end
end
