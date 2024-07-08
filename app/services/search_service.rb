class SearchService

  def search_by_category(params)
    category = Category.find_by_name(params)
    @leisures = @leisures.where(category: category)
  end

  def search_by_date(params)

    today = Date.today
    case params
    when 'gratuito'
      @leisures = Leisure.where(free: true)
    when 'hoje'
      @leisures = Leisure.where(start_date: Date.today)
    when 'proximo_mes'
      start_next_month = today.next_month.beginning_of_month
      end_next_month = today.next_month.end_of_month
      @leisures = Leisure.where(start_date: start_next_month..end_next_month)
    when 'fim_de_semana'
      next_saturday = today + ((6 - today.wday) % 7)
      next_sunday = next_saturday + 1
      @leisures = Leisure.where(start_date: next_saturday..next_sunday)
                  .or(Leisure.where(end_date: next_saturday..next_sunday))
    end
  end

  def search_by_where(params)
    zones = { 'zona_sul' => 'Zona Sul', 'zona_norte' =>  'Zona Norte', 'zona_oeste' => 'Zona Oeste', 'centro' => 'Centro' }

    venues = Venue.where(zone: zones[params])
    venues.map { |venue| venue.leisures}.flatten
  end

  def search_by_when(params)
    case params
    when 'hoje'
      Leisure.where(start_date: Date.today)
    when 'amanha'
      Leisure.where(start_date: Date.today + 1)
    when 'semana'
      Leisure.where(start_date: Date.today..Date.today + 7)
    end
  end
end