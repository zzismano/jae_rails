class SectionCardsController < ApplicationController

  def create
    
    card_ids = params[:section_card][:card_id].compact_blank

    card_ids.each do |card_id|
      @section_card = SectionCard.new(section_cards_params)
      @section_card.card_id = card_id.to_i
      authorize @section_card
      @section_card.save
    end
    redirect_to section_config_path
  end

  private 

  def section_cards_params
    params.require(:section_card).permit(:section_id, :card_id)
  end
end
