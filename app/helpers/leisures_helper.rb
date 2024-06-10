module LeisuresHelper
  def partial_select(leisure)
    "shared/#{leisure.category.name.downcase}"
  end
end
