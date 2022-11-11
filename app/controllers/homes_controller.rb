class HomesController < ApplicationController
  before_action :set_home, only: %i[]

  # GET /homes or /homes.json
  def index
    @homes = Home.all
  end

end