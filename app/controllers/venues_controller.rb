class VenuesController < ApplicationController
  before_action :set_venue, only: [:edit, :update, :destroy]

  def index
    @venues = policy_scope(Venue)
  end

  def new
    @venue = Venue.new
    authorize @venue
  end

  def create
    @venue = Venue.new(venue_params)
    @venue.user = current_user
    authorize @venue
    @venue.save
    if @venue.save
      redirect_to dashboard_path
    end
  end

  def edit
    authorize @venue
  end

  def update
    authorize @venue
    @venue.update(venue_params)

    redirect_to venues_path
  end

  def destroy
    authorize @venue
    @venue.destroy
    if @venue.destroy
      redirect_to venues_path
    end
  end

  private

  def venue_params
    params.require(:venue).permit(:name, :address, :capacity, :website, :zone)
  end

  def set_venue
    @venue = Venue.find(params[:id])
  end
end
