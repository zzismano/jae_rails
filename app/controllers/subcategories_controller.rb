class SubcategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:index]
  def index
    @subcategories = policy_scope(Subcategory).where(category_id: params[:category_id])
    respond_to do |format|
      format.json { render json: @subcategories.as_json(only: [:id, :name]) }
    end
  end
end
