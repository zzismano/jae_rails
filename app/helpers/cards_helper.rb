module CardsHelper
  def calculate_date(date)
    weekdays = { 0 => 'Dom', 1 => 'Seg', 2 => 'Ter', 3 => 'Qua', 4 => 'Qui', 5 => 'Sex', 6 => 'Sab' }

    return "#{weekdays[date.wday]}, #{date.mday}"
  end
end
