class BannersController < ApplicationController
  before_action :set_banner, only: %i[ edit update destroy ]

  def index
    @banners = policy_scope(Banner)
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
    authorize @banner
  end

  def update
    authorize @banner
    @banner.update(banner_params)

    redirect_to root_path
  end

  def destroy
  end

  def banner_config
    @banner = Banner.last
    authorize @banner
  end

  private

  def set_banner
    @banner = Banner.find(params[:id])
  end

  def banner_params
    params.require(:banner).permit(:title_one, :title_two, :title_three, :title_four, :title_five, :caption_one, :caption_two, :caption_three, :caption_four, :caption_five, :photo_one, :photo_two, :photo_three, :photo_four, :photo_five, :link_one, :link_two, :link_three, :link_four, :link_five, :alt_text_one, :alt_text_two, :alt_text_three, :alt_text_four, :alt_text_five)
  end
end
