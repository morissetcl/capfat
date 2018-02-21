class UsersController < MarkersController

  def show
    @user = User.find(params[:id])
    @user_artworks = Artwork.where(user: @user)
  end
end
