class BillboardsController < ApplicationController
  before_action :find_billboard, only: [:edit, :show, :update, :destroy]

  def index
    @billboards = Billboard.all
  end

  def new
    @billboard = Billboard.new
  end

  def create
    @billboard = Billboard.new(billboard_params)
    if @billboard.save
      redirect_to billboards_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @billboard.update(billboard_params)
      redirect_to billboard_path(@billboard)
    else
      render 'edit'
    end
  end

  def destroy
    @billboard.destroy
    redirect_to billboards_path
  end

  def find_song
    @billboard = Billboard.find(params[:id])
    @songs = Song.where('billboard_id IS ?', nil)
  end

  def add_song
    @billboard = Billboard.find(params[:id])
    @song = Song.find(params[:format])
    @song.update(billboard_id: params[:id])
    redirect_to billboard_path(@billboard)
  end

  def remove_from_bill
    @billboard = Billboard.find(params[:id])
    @song = Song.find(params[:song_id])
    @song.update(billboard_id: nil)
    redirect_to billboard_path(@billboard)
  end

  private

    def billboard_params
      params.require(:billboard).permit(:name)
    end

    def find_billboard
      @billboard = Billboard.find(params[:id])
    end
end
