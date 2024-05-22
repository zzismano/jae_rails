class LeisureVenuesController < ApplicationController
  before_action :set_leisure, only: %i[new create]

  def new
    authorize @leisure
    @leisure_venue = LeisureVenue.new
    authorize @leisure_venue
  end

  def create
    raise
    # @venue = venue.find(params[:leisure_venue][:venue])
    # @leisure_venue = LeisureVenue.new(leisure: @leisure, venue: @venue)
    # @leisure_venue.save
    # authorize @leisure
    # authorize @leisure_venue
    # authorize @venue
    # redirect_to dashboard_path
  end

  def destroy
    @leisure_venue = LeisureVenue.find(params[:id])
    @leisure_venue.destroy
    authorize @leisure_venue
    if @leisure_venue.destroy
      redirect_to dashboard_path
    end

  end

  private

  def set_leisure
    @leisure = Leisure.find(params[:leisure_id])
  end

  def leisure_venues_params
    params.require(:leisure_venue).permit(:leisure_id, :venue_id)
  end

end
