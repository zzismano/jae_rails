class CardsController < ApplicationController

  def index
    @cards = policy_scope(Card)
  end

  def new
    @card = Card.new
    authorize @card
  end

  def create
    @card = Card.new(card_params)
    authorize @card
    if @card.save
      redirect_to card_config_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @card = Card.find(params[:id])
    authorize @card
    @card.destroy

    redirect_to dashboard_path
  end

  def card_config
    @cards = Card.all
    authorize @cards
  end

  private

  def card_params
    params.require(:card).permit(:leisure_id)
  end
end
