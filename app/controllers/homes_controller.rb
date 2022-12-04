class HomesController < ApplicationController
  before_action :set_home, only: %i[]

  # GET /homes or /homes.json
  def index
    @products = Product.all
    
  end

end