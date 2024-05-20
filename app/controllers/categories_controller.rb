class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = policy_scope(Category)
  end

  def new
    @category = Category.new
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    authorize @category
    @category.save
  end

  def edit
    authorize @category
  end

  def update
    authorize @category
    @category.update(category_params)

    redirect_to dashboard_path
  end
  private

  def category_params
    params.require(:category).permit(:name, :subcategories)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
