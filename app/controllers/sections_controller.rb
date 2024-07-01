class SectionsController < ApplicationController

  def section_config
    authorize :section, :section_config?
    @section = Section.new
    authorize @section

    @cards = Card.all

    @section_card = SectionCard.new

    @sections = Section.includes(:section_cards).includes(:cards).all
  end

  def create
    @section = Section.new(section_params)
    authorize @section
    if @section.save
      redirect_to section_config_path, notice: 'A Seção foi criada com sucesso'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def section_params
    params.require(:section).permit(:title)
  end
end
