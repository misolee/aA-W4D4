class AlbumsController < ApplicationController
  def new
    @bands = Band.all
    @album = Album.new
    render :new
  end

  def create
    @album = Album.new(album_params)
    if @album.save
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to new_band_album_url(:band_id)
    end
  end

  def edit
    @bands = Band.all
    @album = Album.find(params[:id])
    render :edit
  end

  def show
    @album = Album.find(params[:id])
    @band = Band.find_by(id: @album[:band_id])
    render :show
  end

  def update
    @album = Album.find(params[:id])
    if @album.update(album_params)
      redirect_to album_url(@album)
    else
      flash[:errors] = @album.errors.full_messages
      redirect_to edit_album_url
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to albums_url
  end

  def album_params
    params.require(:album).permit(:title, :year, :live, :band_id)
  end
end
