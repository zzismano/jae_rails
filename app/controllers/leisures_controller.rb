class LeisuresController < ApplicationController
  before_action :set_leisure, only: [:edit, :update, :destroy]

  def index
    @leisures = policy_scope(Leisure)
  end

  def new
    @leisure = Leisure.new
    authorize @leisure
  end

  def create
    @leisure = Leisure.new(leisure_params)
    authorize @leisure
    @leisure.save
  end

  def edit
    authorize @leisure
  end

  def update
    authorize @leisure
    @leisure.update(leisure_params)

    redirect_to dashboard_path
  end

  def destroy
    authorize @leisure
    @leisure.destroy
  end

  def dashboard
    @leisures = Leisure.all
    authorize @leisures
  end

  private

  def leisure_params
    params.require(:leisure).permit(:category_id, :venue_id, :photo, :genre, :link, :title, :subtitle, :director, :country, :description, :features, :min_age, :duration, :time, :start_date, :end_date)
  end

  def set_leisure
    @leisure = Leisure.find(params[:id])
  end

end
