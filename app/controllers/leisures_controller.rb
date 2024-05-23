class LeisuresController < ApplicationController
  before_action :set_leisure, only: [:edit, :update, :destroy]

  def index
    @leisures = policy_scope(Leisure)
  end

  def new
    @leisure = Leisure.new
    authorize @leisure
  end

  def create
    @leisure = Leisure.new(leisure_params)
    @leisure.user = current_user
    @leisure.save
    # redirect_to leisure_leisure_venues_path(@leisure)
    params[:leisure][:genre_ids].compact_blank.each do |genre_id|
      @leisure_genre = LeisureGenre.new(leisure_id: @leisure.id, genre_id: genre_id)
      @leisure_genre.save
    end
    params[:leisure][:venue_ids].compact_blank.each do |venue_id|
      @leisure_venue = LeisureVenue.new(leisure_id: @leisure.id, venue_id: venue_id)
      @leisure_venue.save
    end
    authorize @leisure
    authorize @leisure_genre
    authorize @leisure_venue
    if @leisure.save
      redirect_to dashboard_path
    end
  end

  def edit
    authorize @leisure
  end

  def update
    authorize @leisure
    @leisure.update(leisure_params)
    params[:leisure][:genre_ids].compact_blank.each do |genre_id|
      if LeisureGenre.where(leisure_id: @leisure.id, genre_id: genre_id).empty?
        @leisure_genre = LeisureGenre.new(leisure_id: @leisure.id, genre_id: genre_id)
        @leisure_genre.save
      end
    end
    params[:leisure][:venue_ids].compact_blank.each do |venue_id|
      if LeisureVenue.where(leisure_id: @leisure.id, venue_id: venue_id).empty?
        @leisure_venue = LeisureVenue.new(leisure_id: @leisure.id, venue_id: venue_id)
        @leisure_venue.save
      end
    end

    redirect_to dashboard_path
  end

  def destroy
    authorize @leisure
    @leisure.destroy
  end

  def dashboard
    @leisures = Leisure.all
    authorize @leisures
  end

  private

  def leisure_params
    params.require(:leisure).permit(:category_id, :photo, :link, :title, :subtitle, :director, :country, :description, :features, :min_age, :duration, :time, :start_date, :end_date)
  end

  def set_leisure
    @leisure = Leisure.find(params[:id])
  end

end
