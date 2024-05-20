class GenresController < ApplicationController
  before_action :set_genre, only: [:edit, :update]

  def index
    @genres = policy_scope(Genre)
  end

  def new
    @genre = Genre.new
    authorize @genre
  end

  def create
    @genre = Genre.new(genre_params)
    authorize @genre
    @genre.save
  end

  def edit
    authorize @genre
  end

  def update
    authorize @genre
    @genre.update(genre_params)

    redirect_to dashboard_path
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

  def set_genre
    @genre = Genre.find(params[:id])
  end
end
