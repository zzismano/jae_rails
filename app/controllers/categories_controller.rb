class CategoriesController < ApplicationController
  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    @category.save
  end

  private

  def category_params
    params.require(:category).permit(:name, :subcategories)
  end
end
