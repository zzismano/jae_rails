module LeisuresHelper
  def partial_select(leisure)
    "shared/#{leisure.category.name.downcase}"
  end

  def format_price(price)
    # Check if the price has decimal places that are not zero
    if price % 1 == 0
      # No decimal places needed
      number_with_precision(price, precision: 0, separator: ',', delimiter: '.')
    else
      # Show decimal places
      number_with_precision(price, precision: 2, separator: ',', delimiter: '.')
    end
  end
end

