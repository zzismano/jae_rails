class BannersController < ApplicationController

  def index
  end

  def show
  end

  def new
    @banner = Banner.new
    authorize @banner
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private 

  def banner_params
    params.require(:banner).permit(:caption_one, :caption_two, :caption_three, :caption_four, :photo_one, :photo_two, :photo_three, :photo_four)
  end
end
