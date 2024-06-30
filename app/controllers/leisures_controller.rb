class LeisuresController < ApplicationController
  before_action :set_leisure, only: [:edit, :update, :destroy]

  def home
    @banner = Banner.first
    authorize @banner
  end

  def index
    @leisures = policy_scope(Leisure)
    # load hero banner on LP.
    @banner = Banner.first

  end

  def evento_filter
    filme = Category.find_by_name("Filme")
    @films = filme.leisures
    authorize @films
  end

  def teatro_filter
    teatro = Category.find_by_name("Teatro")
    @plays = teatro.leisures
    authorize @plays
  end

  def musica_filter
    musica = Category.find_by_name("Musica")
    @shows = musica.leisures
    authorize @shows
  end

  def danca_filter
    danca = Category.find_by_name("Danca")
    @shows = danca.leisures
    authorize @shows
  end

  def festa_filter
    festa = Category.find_by_name("Festa")
    @parties = festa.leisures
    authorize @parties
  end


  def evento_filter
    evento = Category.find_by_name("Evento")
    @events = evento.leisures
    authorize @events
  end

  def expo_filter
    expo = Category.find_by_name("Expo")
    @expos = expo.leisures
    authorize @expos
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
    if !params[:leisure][:genre_ids].empty?
      params[:leisure][:genre_ids].compact_blank.each do |genre_id|
        @leisure_genre = LeisureGenre.new(leisure_id: @leisure.id, genre_id: genre_id)
        @leisure_genre.save
      end
    end

    if !params[:leisure][:venue_ids].empty?
      params[:leisure][:venue_ids].compact_blank.each do |venue_id|
        @leisure_venue = LeisureVenue.new(leisure_id: @leisure.id, venue_id: venue_id)
        @leisure_venue.save
      end
    end

    authorize @leisure

    if @leisure_genre
      authorize @leisure_genre
    end

    if @leisure_venue
      authorize @leisure_venue
    end

    if @leisure.save
      redirect_to dashboard_path
    else
      # Add `status: :unprocessable_entity` here
      render :new, status: :unprocessable_entity
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
    if @leisure.destroy
      redirect_to dashboard_path
    end
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
