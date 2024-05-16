class GenresController < ApplicationController
  def new
    @genre = Genre.new
    authorize @genre
  end

  def create
    @genre = Genre.new(genre_params)
    authorize @genre
    @genre.save
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end
end
