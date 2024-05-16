class LeisuresController < ApplicationController

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

  private

  def leisure_params
    params.require(:leisure).permit(:category_id, :venue_id, :picture, :genre, :link, :title, :subtitle, :director, :country, :description, :features, :min_age, :duration, :time, :start_date, :end_date)
  end

end
