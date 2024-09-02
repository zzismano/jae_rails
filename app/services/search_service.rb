class SearchService

  def search_by_query(params) # search by typing query
    Leisure.global_search(params)
  end

  def search_by_when(leisures, params)
    today = Date.today

    case params
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



  def search_by_query_and_where(params)
    Leisure.global_search(params[:query]).global_search(params[:where])
  end

  def search_by_query_and_when(params)
    Leisure.global_search(params[:query]).global_search(params[:when])
  end

  def search_by_date(date_param)
    today = Date.today
    case date_param
    when 'gratuito'
      Leisure.where(free: true)
    when 'hoje'
      Leisure.where("dates @> ?::jsonb", [today.to_s].to_json)
    when 'proximo_mes'
      start_next_month = today.next_month.beginning_of_month
      end_next_month = today.next_month.end_of_month
      date_range = (start_next_month..end_next_month).to_a.map(&:to_s)
      matches = []
      Leisure.all.each do |leisure|
        unless (leisure.dates & date_range).empty?
          matches << leisure
        end
      end
      matches


    when 'fim_de_semana'
      next_saturday = today + ((6 - today.wday) % 7)
      next_sunday = next_saturday + 1
      Leisure.where("dates @> ?::jsonb", [next_saturday.to_s, next_sunday.to_s].to_json)
    else
      Leisure.none # or handle unexpected cases
    end
  end





  def filter_by_subcategory(leisures, subcategory_param)
    Leisure.where(subcategory: subcategory_param)

  end

  def filter_by_subcategory_and_where(params)
    subcategory_leisures = Leisure.where(subcategory: params[:subcategory])
    filtered_leisures = subcategory_leisures.global_search(params[:where])
    filtered_leisures
  end



end
