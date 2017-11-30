class ArtistsController < ApplicationController
  before_action :find_artist, only: [:show, :edit, :update, :destroy]

  def index
    @artists = Artist.all
  end

  def show
  end

  def new
    @artist = Artist.new
    render partial: 'form'
  end
  def edit
    render partial: 'form'
  end

  def create
    @artist = Artist.new(artist_params)
    if @artist.save
      redirect_to artists_path
    else
      render partial: 'form'
    end
  end

  def update
    if @artist.update(artist_params)
      redirect_to artist_path(@artist)
    else
      render partial: 'form'
    end
  end

  def destroy
    @artist.destroy
    redirect_to artists_path
  end

  private
    def artist_params
      params.require(:artist).permit(:name, :genre)
    end
    def find_artist
      @artist = Artist.find(params[:id])
    end
end
