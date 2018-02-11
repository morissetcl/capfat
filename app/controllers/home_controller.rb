class HomeController < MarkersController
  def index
    super
    fresh_when(@users)
  end
end
