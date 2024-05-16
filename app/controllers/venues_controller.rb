class VenuesController < ApplicationController
  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    authorize @venue
    @venue.save
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :capacity, :website)
  end
end
