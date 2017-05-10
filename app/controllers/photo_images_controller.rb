class PhotoImagesController < ApplicationController
  before_action :set_photo_image, only: [:show, :edit, :update, :destroy]

  # GET /photo_images
  # GET /photo_images.json
  def index
    @photo_images = PhotoImage.all
    @album = Album.find(params[:album_id])
    Rails.logger.warn @album.inspect
  end

  # GET /photo_images/1
  # GET /photo_images/1.json
  def show
  end

  # GET /photo_images/new
  def new
    @photo_image = PhotoImage.new
    @album = Album.find(params[:album_id])
    Rails.logger.warn @album.inspect
  end

  # GET /photo_images/1/edit
  def edit
    @album = Album.find(params[:album_id])
  end

  # POST /photo_images
  # POST /photo_images.json
  def create
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

  # PATCH/PUT /photo_images/1
  # PATCH/PUT /photo_images/1.json
  def update
    respond_to do |format|
      if @photo_image.update(photo_image_params)
        format.html { redirect_to @photo_image, notice: 'Photo image was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo_image }
      else
        format.html { render :edit }
        format.json { render json: @photo_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photo_images/1
  # DELETE /photo_images/1.json
  def destroy
    @photo_image.destroy
    respond_to do |format|
      format.html { redirect_to photo_images_url, notice: 'Photo image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo_image
      @photo_image = PhotoImage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_image_params
      params.require(:photo_image).permit(:name, :album_id, :image, :description)
    end
end
