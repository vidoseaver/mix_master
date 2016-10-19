class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find params[:id]
    @artist = Artist.find @song.artist_id
  end

  def new
    @artist = Artist.find params[:artist_id]
    @song = @artist.songs.new
  end

  def create
    @artist = Artist.find(params[:artist_id])
    @song = @artist.songs.create(song_params)
    redirect_to song_path(@song)
  end


  private
  def song_params
    params.require(:song).permit(:song_title)
  end

  def song_id
    params(:song_id)
  end
end
