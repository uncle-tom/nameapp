class AlbumsController < ApplicationController
  inherit_resources
  before_action :set_album, only: [:show, :edit, :update, :destroy]

  # GET /albums
  # GET /albums.json
  def index
    @albums = Album.all

    index!
  end

  # POST /albums
  # POST /albums.json
  def create
    @albums = Album.new(album_params)
    @albums.user_id = current_user.id if current_user
    @image = PhotoImage.new user: current_user, album: album
    @images = album.photo_images.where('id IS NOT NULL')
  end

  # GET /albums/1
  # GET /albums/1.json
  def show
    @user = User.find(params[:user_id])
    album = @user.albums.find(params[:id])
    @image = PhotoImage.new user: current_user, album: album
    @images = album.photo_images.where('id IS NOT NULL')
    show!
  end

  # GET /albums/new
  def new
    @album = Album.new
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
  end

  # GET /albums/1/edit
  def edit
    @user = User.new
    @user = params[:user_id] ? User.find(params[:user_id]) : current_user
  end

  # PATCH/PUT /albums/1
  # PATCH/PUT /albums/1.json
  def update
    @user = User.new
    @photo_image = PhotoImage.new(photo_image_params)
    @album = Album.find(params[:album_id])
    @photo_image.user = current_user
    @photo_image.album_id = @album.id if @album
    respond_to do |format|
      if @photo_image.save
        format.html { redirect_to @photo_image, notice: 'Photo image was successfully created.' }
        format.json { render :show, status: :created, location: @photo_image }
      else
        format.html { render :new }
        format.json { render json: @photo_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /albums/1
  # DELETE /albums/1.json
  def destroy
    @album.destroy
    respond_to do |format|
      format.html { redirect_to albums_url, notice: 'Album was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_album
      @album = Album.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def album_params
      params.require(:album).permit(:name)
    end
end
