class LeisuresController < ApplicationController
  def index
    @leisures = Leisure.all
  end
end
