class BannersController < ApplicationController
  before_action :set_banner, only: %i[show edit update destroy]

  def index
  end

  def show
  end

  def new
    @banner = Banner.new
    authorize @banner
  end

  def create
    @banner = Banner.new(banner_params)
    authorize @banner
    if @banner.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
    
  end

  def edit
    
  end

  def update
  end

  def destroy
  end

  private 

  def set_banner
    @banner = Banner.find(params[:id])
  end

  def banner_params
    params.require(:banner).permit(:caption_one, :caption_two, :caption_three, :caption_four, :photo_one, :photo_two, :photo_three, :photo_four)
  end
end
