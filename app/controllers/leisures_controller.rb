class LeisuresController < ApplicationController
  before_action :set_leisure, only: [:edit, :destroy]
  before_action :set_fullpath, only: [:filme, :teatro, :musica, :danca, :evento, :festa, :expo]
  skip_before_action :authenticate_user!, only: [:home, :index, :filme, :teatro, :musica, :danca, :evento, :festa, :expo, :mais, :about_us]
  before_action :start_search_service, only: [:home, :index, :filme, :teatro, :musica, :danca, :evento, :festa, :expo, :mais]
  skip_after_action :verify_authorized, only: [:about_us]
  def home
    @banner = Banner.first
    authorize @banner

    @sections = Section.includes(:cards).all


  end

  def index

    @leisures = policy_scope(Leisure)
    # load hero banner on LP.
    @banner = Banner.first
    date_param = params[:date]
    if params[:query].present? && params[:where].present?
      @leisures = @service.search_by_query_and_where(params)
    elsif params[:query].present? && params[:when].present?
      @leisures = @service.search_by_query_and_when(params)
    elsif params[:query].present?
      @leisures = @service.search_by_query(params[:query])
    elsif params[:date].present?
      @leisures = SearchService.new.search_by_date(date_param)
    end
    @leisures = @leisures.sort_by { |leisure| leisure[:dates] || [] }
    @leisures


  end

  def set_fullpath
    @path = request.fullpath
  end


  def filme
    filme = Category.find_by(name: 'Filme')
    @leisures = Leisure.where(category: filme)
    authorize @leisures

    if params[:where].present?
      @leisures = @service.search_by_where(@leisures, params[:where])
    elsif params[:when].present?
      @leisures = @service.search_by_when(@leisures, params[:when])
    elsif params[:when].present? && params[:where].present?
      @leisures = @service.search_by_when_and_where(params)
    elsif params[:subcategory].present?
      @leisures = @service.filter_by_subcategory(@leisures, params[:subcategory])

    end
      @leisures = @leisures.sort_by { |leisure| leisure[:dates] || [] }
    @leisures
  end

  def teatro
    teatro = Category.find_by(name: 'Teatro')
    @leisures = Leisure.where(category: teatro)
    authorize @leisures

    if params[:where].present?
      @leisures = @service.search_by_where(@leisures, params[:where])
    elsif params[:when].present?
      @leisures = @service.search_by_when(@leisures, params[:when])
    elsif params[:subcategory].present?
      @leisures = @service.filter_by_subcategory(@leisures, params[:subcategory])
    end
      @leisures = @leisures.sort_by { |leisure| leisure[:dates] || [] }
    @leisures
  end

  def musica
    musica = Category.find_by(name: 'Musica')
    @leisures = Leisure.where(category: musica)
    authorize @leisures

    if params[:where].present?
      @leisures = @service.search_by_where(@leisures, params[:where])
    elsif params[:when].present?
      @leisures = @service.search_by_when(@leisures, params[:when])
    elsif params[:subcategory].present?
      @leisures = @service.filter_by_subcategory(@leisures, params[:subcategory])
    end
      @leisures = @leisures.sort_by { |leisure| leisure[:dates] || [] }
    @leisures
  end

  def danca
    danca = Category.find_by(name: 'Danca')
    @leisures = Leisure.where(category: danca)
    authorize @leisures

    if params[:where].present?
      @leisures = @service.search_by_where(@leisures, params[:where])
    elsif params[:when].present?
      @leisures = @service.search_by_when(@leisures, params[:when])
    elsif params[:subcategory].present?
      @leisures = @service.filter_by_subcategory(@leisures, params[:subcategory])
    end
      @leisures = @leisures.sort_by { |leisure| leisure[:dates] || [] }
    @leisures

  end

  def evento
    evento = Category.find_by(name: 'Evento')
    @leisures = Leisure.where(category: evento)
    authorize @leisures

    if params[:where].present?
      @leisures = @service.search_by_where(@leisures, params[:where])
    elsif params[:when].present?
      @leisures = @service.search_by_when(@leisures, params[:when])
    elsif params[:subcategory].present?
      @leisures = @service.filter_by_subcategory(@leisures, params[:subcategory])
    end
      @leisures = @leisures.sort_by { |leisure| leisure[:dates] || [] }
    @leisures
  end

  def festa
    festa = Category.find_by(name: 'Festa')
    @leisures = Leisure.where(category: festa)
    authorize @leisures

    if params[:where].present?
      @leisures = @service.search_by_where(@leisures, params[:where])
    elsif params[:when].present?
      @leisures = @service.search_by_when(@leisures, params[:when])
    elsif params[:subcategory].present?
      @leisures = @service.filter_by_subcategory(@leisures, params[:subcategory])
    end
      @leisures = @leisures.sort_by { |leisure| leisure[:dates] || [] }
    @leisures
  end

  def expo
    expo = Category.find_by(name: 'Expo')
    @leisures = Leisure.where(category: expo)
    authorize @leisures

    if params[:where].present?
      @leisures = @service.search_by_where(@leisures, params[:where])
    elsif params[:when].present?
      @leisures = @service.search_by_when(@leisures, params[:when])
    elsif params[:subcategory].present?
      @leisures = @service.filter_by_subcategory(@leisures, params[:subcategory])
    end
      @leisures = @leisures.sort_by { |leisure| leisure[:dates] || [] }
    @leisures
  end

  def mais
    mais = Category.find_by(name: 'Mais')
    @leisures = Leisure.where(category: mais)
    authorize @leisures

    if params[:where].present?
      @leisures = @service.search_by_where(@leisures, params[:where])
    elsif params[:when].present?
      @leisures = @service.search_by_when(@leisures, params[:when])
    elsif params[:subcategory].present?
      @leisures = @service.filter_by_subcategory(@leisures, params[:subcategory])
    end
      @leisures = @leisures.sort_by { |leisure| leisure[:dates] || [] }
    @leisures
  end

  def new
    @leisure = Leisure.new
    authorize @leisure
  end

  def create
    genre_ids = params[:leisure].delete(:genre_ids).compact_blank
    venue_ids = params[:leisure].delete(:venue_ids).compact_blank
    @leisure = Leisure.new(leisure_params)
    @leisure.user = current_user
    sorted_dates = @leisure.dates.sort
    @leisure.dates = sorted_dates
    if @leisure.save
      # Handle genres
      genre_ids.each do |genre_id|
        if LeisureGenre.where(leisure_id: @leisure.id, genre_id: genre_id).empty?
          @leisure_genre = LeisureGenre.new(leisure_id: @leisure.id, genre_id: genre_id)
          @leisure_genre.save
        end
      end

      # Handle venues
      venue_ids.each do |venue_id|
        if LeisureVenue.where(leisure_id: @leisure.id, venue_id: venue_id).empty?
          @leisure_venue = LeisureVenue.new(leisure_id: @leisure.id, venue_id: venue_id)
          @leisure_venue.save
        end
      end
      redirect_to dashboard_path
      else
      # Add `status: :unprocessable_entity` here
      render :new, status: :unprocessable_entity
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
    @leisure = Leisure.find(params[:id])
    authorize @leisure

    # Temporarily remove genre_ids and venue_ids from params before update
    genre_ids = params[:leisure].delete(:genre_ids).compact_blank
    venue_ids = params[:leisure].delete(:venue_ids).compact_blank
    @leisure.dates = params[:leisure][:dates].split(',').map(&:strip) if params[:leisure][:dates]
    sorted_dates = @leisure.dates.sort
    @leisure.dates = sorted_dates

    if @leisure.update(leisure_params)
      # Handle genres
      genre_ids.each do |genre_id|
        if LeisureGenre.where(leisure_id: @leisure.id, genre_id: genre_id).empty?
          @leisure_genre = LeisureGenre.new(leisure_id: @leisure.id, genre_id: genre_id)
          @leisure_genre.save
        end
      end

      # Handle venues
      venue_ids.each do |venue_id|
        if LeisureVenue.where(leisure_id: @leisure.id, venue_id: venue_id).empty?
          @leisure_venue = LeisureVenue.new(leisure_id: @leisure.id, venue_id: venue_id)
          @leisure_venue.save
        end
      end

      redirect_to dashboard_path, notice: 'Leisure updated successfully.'
    else
      puts @leisure.errors.full_messages # Debugging line
      render :edit
    end
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

  def about_us
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end



  private

  def start_search_service
    @service = SearchService.new
  end

  def leisure_params
    params.require(:leisure).permit(:category_id, :subcategory_id, :photo, :link, :title, :subtitle, :director, :country, :description, :schedule, :features, :min_age, :duration, :time, :start_date, :end_date, :publish_date, :hidden, :free, :date, dates: [])
  end

  def set_leisure
    @leisure = Leisure.find(params[:id])
  end

end
