class AlbumsController < ApplicationController
  before_action :authenticate_user!
  def index
    @albums = current_user.albums.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @album = Album.find(params[:id])
    @pictures = @album.pictures.paginate(:page => params[:page], :per_page => 12)
  end

  def create
    @album = current_user.albums.new(album_params)
    respond_to do |format|
      if @album.save
        # Response
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :new }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :private)
    end
end
