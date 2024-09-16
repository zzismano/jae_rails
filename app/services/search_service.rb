class SearchService

  def search_by_query(params) # search by typing query
    Leisure.global_search(params).visible.published
  end

  def search_by_when(leisures, params)
    today = Date.today

    case params
    when 'hoje'
      leisures.where("dates @> ?::jsonb", [today.to_s].to_json)
    when 'fimdesemana'
      next_friday = today + ((5 - today.wday) % 7)
      next_saturday = today + ((6 - today.wday) % 7)
      next_sunday = next_saturday + 1
      date_range = (next_friday..next_sunday).to_a.map(&:to_s)
      matches = []
      leisures.each do |leisure|
        unless (leisure.dates & date_range).empty?
          matches << leisure
        end
      end
      matches
    when 'semana'
      start_of_week = today
      end_of_week = today + 7
      date_range = (start_of_week..end_of_week).to_a.map(&:to_s)
      matches = []
      leisures.each do |leisure|
        unless (leisure.dates & date_range).empty?
          matches << leisure
        end
      end
      matches


    end
  end




  def search_by_where(leisures, params)
    zones = { 'zona_sul' => 'Zona Sul', 'zona_norte' =>  'Zona Norte', 'zona_oeste' => 'Zona Oeste', 'centro' => 'Centro' }

    venues = Venue.where(zone: zones[params])
    venues.map { |venue| venue.leisures}.flatten

    leisures.global_search(params)
  end

  # def search_by_date(params)

  #   today = Date.today
  #   case params
  #   when 'gratuito'
  #     Leisure.where(free: true)
  #   when 'hoje'
  #     Leisure.where(start_date: Date.today)
  #   when 'proximo_mes'
  #     start_next_month = today.next_month.beginning_of_month
  #     end_next_month = today.next_month.end_of_month
  #     Leisure.where(start_date: start_next_month..end_next_month)
  #   when 'fim_de_semana'
  #     next_saturday = today + ((6 - today.wday) % 7)
  #     next_sunday = next_saturday + 1
  #     Leisure.where(start_date: next_saturday..next_sunday)
  #                 .or(Leisure.where(end_date: next_saturday..next_sunday))
  #   when 'semana'
  #     Leisure.where(start_date: Date.today..Date.today + 7)
  #   end
  # end


  def search_by_query_and_where_and_when(leisures, params)
    filtered_leisures = leisures.global_search(params[:query]).global_search(params[:where]).visible.published
    filtered_leisures.global_search(params[:when])
    today = Date.today
    when_param = params[:when]
    where_param = params[:where]

    case params[:when]
    when 'hoje'
      filtered_leisures.where("dates @> ?::jsonb", [today.to_s].to_json)
    when 'amanha'
      filtered_leisures.where("dates @> ?::jsonb", [(today + 1).to_s].to_json)
    when 'semana'
      start_of_week = today
      end_of_week = today + 7
      date_range = (start_of_week..end_of_week).to_a.map(&:to_s)
      matches = []
      filtered_leisures.each do |leisure|
        unless (leisure.dates & date_range).empty?
          matches << leisure
        end
      end
      matches


    end

  end
  def search_by_query_and_where(params)
    Leisure.global_search(params[:query]).global_search(params[:where]).visible.published
  end

  def search_by_query_and_when(params)
    leisures = Leisure.global_search(params[:query]).visible.published
    today = Date.today

    case params[:when]
    when 'hoje'
      leisures.where("dates @> ?::jsonb", [today.to_s].to_json)
    when 'amanha'
      leisures.where("dates @> ?::jsonb", [(today + 1).to_s].to_json)
    when 'semana'
      start_of_week = today
      end_of_week = today + 7
      date_range = (start_of_week..end_of_week).to_a.map(&:to_s)
      matches = []
      leisures.each do |leisure|
        unless (leisure.dates & date_range).empty?
          matches << leisure
        end
      end
      matches


    end
  end


  def search_by_date(leisures, date_param)
    today = Date.today
    case date_param
    when 'gratuito'
      leisures.where(free: true).visible.published
    when 'hoje'
      Leisure.where("dates @> ?::jsonb", [today.to_s].to_json).visible.published
    when 'proximo_mes'
      start_next_month = today.next_month.beginning_of_month
      end_next_month = today.next_month.end_of_month
      date_range = (start_next_month..end_next_month).to_a.map(&:to_s)
      matches = []
      Leisure.visible.published.each do |leisure|
        unless (leisure.dates & date_range).empty?
          matches << leisure
        end
      end
      matches


    when 'fim_de_semana'
      # Calculate next Friday, Saturday, and Sunday
      next_friday = today + ((5 - today.wday) % 7)
      next_saturday = today + ((6 - today.wday) % 7)
      next_sunday = next_saturday + 1

      # Create date range array
      date_range = (next_friday..next_sunday).to_a.map(&:to_s)

      # Find matching leisures
      matches = Leisure.visible.published.select do |leisure|
        (leisure.dates & date_range).any?
      end
      matches
    end
  end





  def search_by_where_and_when(leisures, params)
    # Extract the 'when' and 'where' parameters
    when_param = params[:when]
    where_param = params[:where]

    # Filter by 'when' first
    today = Date.today

    case when_param
    when 'hoje'
      leisures = leisures.where("dates @> ?::jsonb", [today.to_s].to_json)
    when 'fimdesemana'
      next_friday = today + ((5 - today.wday) % 7)
      next_saturday = today + ((6 - today.wday) % 7)
      next_sunday = next_saturday + 1
      leisures = leisures.where("dates @> ?::jsonb", [next_friday.to_s, next_saturday.to_s, next_sunday.to_s].to_json)
    when 'semana'
      start_of_week = today
      end_of_week = today + 7
      date_range = (start_of_week..end_of_week).to_a.map(&:to_s)
      leisures = leisures.select do |leisure|
        !(leisure.dates & date_range).empty?
      end
    else
      leisures = Leisure.none
    end

    # Then filter by 'where'
    zones = { 'zona_sul' => 'Zona Sul', 'zona_norte' => 'Zona Norte', 'zona_oeste' => 'Zona Oeste', 'centro' => 'Centro' }
    venues = Venue.where(zone: zones[where_param])
    venue_leisures = venues.flat_map(&:leisures)

    # Intersect the two results
    filtered_leisures = leisures & venue_leisures

    # Return the filtered leisures
    filtered_leisures
  end

  def filter_by_subcategory(leisures, subcategory_param)
    Leisure.where(subcategory: subcategory_param).visible.published

  end

  def filter_by_subcategory_and_where(leisures, subcategory_param, where_param)
    # Filter by subcategory and ensure the leisure is visible and published
    subcategory_leisures = leisures.where(subcategory: subcategory_param).visible.published



    # Further filter by the 'where' parameter using global search
    filtered_leisures = subcategory_leisures.global_search(where_param)

    filtered_leisures

  end

  def filter_by_subcategory_and_when(leisures, subcategory_param, when_param)
    # Filter by subcategory and ensure the leisure is visible and published
    subcategory_leisures = leisures.where(subcategory: subcategory_param).visible.published

    # Further filter by the 'where' parameter using global search
    today = Date.today

    case when_param
    when 'hoje'
      subcategory_leisures.where("dates @> ?::jsonb", [today.to_s].to_json)
    when 'fimdesemana'
      next_friday = today + ((5 - today.wday) % 7)
      next_saturday = today + ((6 - today.wday) % 7)
      next_sunday = next_saturday + 1
      date_range = (next_friday..next_sunday).to_a.map(&:to_s)
      matches = []
      subcategory_leisures.each do |leisure|
        unless (leisure.dates & date_range).empty?
          matches << leisure
        end
      end
      matches
    when 'semana'
      start_of_week = today
      end_of_week = today + 7
      date_range = (start_of_week..end_of_week).to_a.map(&:to_s)
      matches = []
      subcategory_leisures.each do |leisure|
        unless (leisure.dates & date_range).empty?
          matches << leisure
        end
      end
      matches


    end


  end

  def filter_by_subcategory_and_when_and_where

  end



end
