class CardsController < ApplicationController

  def index
    @cards = policy_scope(Card)
  end

  def new
    @card = Card.new
    authorize @card
  end

  def create
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
