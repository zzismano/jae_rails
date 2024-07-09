class LeisuresController < ApplicationController
  before_action :set_leisure, only: [:edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:home, :index]

  def home
    @banner = Banner.first
    authorize @banner

    @sections = Section.includes(:cards).all


  end

  def index
    
    @leisures = policy_scope(Leisure)
    # load hero banner on LP.
    @banner = Banner.first

    # search service for all tags
    @search_service = SearchService.new
    if params[:category].present?
      @leisures = @search_service.search_by_category(params[:category])
    elsif params[:date].present?
      @leisures = @search_service.search_by_date(params[:date])
    elsif params[:where].present?
      @leisures = @search_service.search_by_where(params[:where])
    elsif params[:when].present? 
      @leisures = @search_service.search_by_when(params[:when])
    elsif params[:query].present? 
      @leisures = @search_service.search_by_query(params[:query])
    end
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

  def newsletter_subscription
    @subscriber = {email: params[:email]}
    authorize @subscriber
  end



  private

  def leisure_params
    params.require(:leisure).permit(:category_id, :photo, :link, :title, :subtitle, :director, :country, :description, :features, :min_age, :duration, :time, :start_date, :end_date, :publish_date, :hidden, :free)
  end

  def set_leisure
    @leisure = Leisure.find(params[:id])
  end

end
