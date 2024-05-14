class LeisuresController < ApplicationController

  def index
    @leisures = policy_scope(Leisure)
  end
end
