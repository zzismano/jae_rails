class SponsoredBannersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_sponsored_banner, only: %i[edit update destroy]

  def index
    @sponsored_banners = policy_scope(SponsoredBanner).order(created_at: :desc)
    authorize SponsoredBanner
  end

  def new
    @sponsored_banner = SponsoredBanner.new
    authorize @sponsored_banner
  end

  def create
    @sponsored_banner = SponsoredBanner.new(sponsored_banner_params)
    authorize @sponsored_banner
    if @sponsored_banner.save
      redirect_to sponsored_banners_path, notice: "Banner criado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @sponsored_banner.update(sponsored_banner_params)
      redirect_to sponsored_banners_path, notice: "Banner atualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sponsored_banner.destroy
    redirect_to sponsored_banners_path, notice: "Banner removido."
  end

  private

  def set_sponsored_banner
    @sponsored_banner = SponsoredBanner.find(params[:id])
    authorize @sponsored_banner
  end

  def sponsored_banner_params
    params.require(:sponsored_banner)
          .permit(:sponsor_name, :link_url, :active, :starts_on, :ends_on, :image)
  end
end
