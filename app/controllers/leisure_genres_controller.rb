class LeisureGenresController < ApplicationController
  before_action :set_leisure, only: %i[new create]

  def new
    authorize @leisure
    @leisure_genre = LeisureGenre.new
    authorize @leisure_genre
  end

  def create
    @genre = Genre.find(params[:leisure_genre][:genre])
    @leisure_genre = LeisureGenre.new(leisure: @leisure, genre: @genre)
    @leisure_genre.save
    authorize @leisure
    authorize @leisure_genre
    authorize @genre
    redirect_to dashboard_path
  end

  def destroy
    @leisure_genre = LeisureGenre.find(params[:id])
    authorize @leisure_genre
    @leisure_genre.destroy
    if @leisure_genre.destroy
      redirect_to dashboard_path
    end

  end

  private

  def set_leisure
    @leisure = Leisure.find(params[:leisure_id])
  end

  def leisure_genres_params
    params.require(:leisure_genre).permit(:leisure_id, :genre_id)
  end

end
