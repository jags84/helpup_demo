class AlbumsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  def index
    @albums = current_user.albums.order('created_at DESC').paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @album = Album.find(params[:id])
    if Album.album_owner(params[:id],current_user) || !@album.private
      @pictures = @album.pictures.paginate(:page => params[:page], :per_page => 12)
    else
      redirect_to albums_path
    end
  end

  def create
    @album = current_user.albums.new(album_params)
    respond_to do |format|
      if @album.save
        # Response
        format.html { redirect_to @album, notice: 'Album was successfully created.' }
        format.json { render :show, status: :created, location: @album }
      else
        format.html { render :index }
        format.json { render json: @album.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @album = Album.find(params[:id])
    if @album.user_id == current_user.id
      respond_to do |format|
        if @album.update(album_params)
          format.html { redirect_to @album, notice: 'Album was successfully updated.' }
          format.json { render :show, status: :ok, location: @album }
        else
          format.html { render :show }
          format.json { render json: @album.errors, status: :unprocessable_entity }
        end
      end
    else
      respond_to do |format|
        format.html { redirect_to @album, notice: 'Album was not updated.' }
        format.json { render :show, status: :ok, location: @album }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:title, :private)
    end
end
