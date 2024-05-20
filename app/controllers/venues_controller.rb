class VenuesController < ApplicationController
  before_action :set_venue, only: [:edit, :update]

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    authorize @venue
    @venue.save
  end

  def edit
    authorize @venue
  end

  def update
    authorize @venue
    @venue.update(venue_params)

    redirect_to dashboard_path
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :capacity, :website)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end
end
