class CategoriesController < ApplicationController
  before_action :set_category, only: [:edit, :update]

  def index
    @categories = policy_scope(Category)
  end

  def new
    @category = Category.new
    @category.subcategories.build
    authorize @category
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user
    authorize @category
    @category.save
    if @category.save
      redirect_to dashboard_path
    end
  end

  def edit
    @category.subcategories.build if @category.subcategories.empty?
    authorize @category
  end

  def update
    authorize @category
    @category.update(category_params)

    redirect_to dashboard_path
  end
  private

  def category_params
    params.require(:category).permit(:name, subcategories_attributes: [:id, :name, :_destroy])
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
