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
    @leisure.save
  end

  private

  def leisure_params
    params.require(:leisure).permit()
  end

end
