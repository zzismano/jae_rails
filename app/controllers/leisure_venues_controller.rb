class LeisureVenuesController < ApplicationController
  include ActionView::RecordIdentifier

  before_action :set_leisure, only: %i[new create]
  before_action :set_leisure_venue, only: [:destroy]

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

    authorize @leisure_venue
    @leisure_venue.destroy

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove(dom_id(@leisure_venue)) }
      format.html { redirect_to leisure_path(@leisure_venue.leisure), notice: 'Sucesso.' }
    end
    # if @leisure_venue.destroy
    #   redirect_to dashboard_path
    # end

  end

  private

  def set_leisure_venue
    @leisure_venue = LeisureVenue.find(params[:id])
  end

  def set_leisure
    @leisure = Leisure.find(params[:leisure_id])
  end

  def leisure_venues_params
    params.require(:leisure_venue).permit(:leisure_id, :venue_id)
  end

end
