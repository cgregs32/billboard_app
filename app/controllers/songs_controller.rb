class SongsController < ApplicationController
  before_action :set_billboard
  before_action :set_song, only: [:show, :edit, :update, :destroy]


  def index
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = @billboard.song.new(song_params)
    if @song.save
      redirect_to billbard_song(@billboard, @song)
    else
      render 'new'
    end
  end


  def edit
  end

  def update
    if @song.update(song_params)
      redirect_to billbard_song(@billboard, @song)
    else
      render 'edit'
    end
  end

  def destroy
    @song.destroy
    redirect_to billboard_songs_path
  end

  private
    def set_song
      @song = Song.find(params[:id])
    end

    def set_billboard
      @billboard = Billboard.find(params[:billboar_id])
    end

    def song_params
      params.require(:song).permit(:name, :rank)
    end


end
