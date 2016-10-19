class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(id)
  end

  def update
    @artist = Artist.find(id)
    @artist.update_attributes(artist_params)
    redirect_to artist_path(@artist)
  end

  def show
    @artist = Artist.find(id)
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artist_path(@artist)
    else
      render :new
    end
  end

  def destroy
    artist = Artist.find(id)
    artist.delete
    redirect_to artists_path
  end


  private

  def artist_params
    params.require(:artist).permit(:name, :image_path)
  end

  def id
    params.require(:id)
  end
end
