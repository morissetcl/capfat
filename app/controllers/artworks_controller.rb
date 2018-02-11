class ArtworksController < MarkersController

  def index
    @artworks = Artwork.all
    @users = User.where.not(latitude: nil, longitude: nil)
    fresh_when(@artworks)
    super
  end

  def new
    @artwork = Artwork.new
  end

  def show
    @artwork = Artwork.find(params[:id])
    @user = Artwork.find(params[:id]).user
    fresh_when [@artwork, @user]
    super
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
