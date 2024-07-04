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


    # search by category on sidebar
    if params[:category].present?
      category = Category.find_by_name(params[:category])
      @leisures = @leisures.where(category: category)
    elsif params[:date].present? 
      date_search_filter(params[:date])
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

  def date_search_filter(date)
    if date == 'hoje'
      @leisures = Leisure.where(start_date: Date.today)
    elsif date == 'proximo_mes'
      today = Date.today
      start_next_month = today.next_month.beginning_of_month
      end_next_month = today.next_month.end_of_month
      @leisures = Leisure.where(start_date: start_next_month..end_next_month)
    elsif date == 'fim_de_semana'
      today = Date.today
      next_saturday = today + ((6 - today.wday) % 7)
      next_sunday = next_saturday + 1
      @leisures = Leisure.where(start_date: next_saturday..next_sunday)
                  .or(Leisure.where(end_date: next_saturday..next_sunday))
    elsif date == 'gratuito'
      @leisures = Leisure.where(free: true)
    end
  end

  private

  def leisure_params
    params.require(:leisure).permit(:category_id, :photo, :link, :title, :subtitle, :director, :country, :description, :features, :min_age, :duration, :time, :start_date, :end_date, :publish_date, :hidden, :free)
  end

  def set_leisure
    @leisure = Leisure.find(params[:id])
  end

end
