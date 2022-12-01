class ApplicationController < ActionController::Base
    include CurrentBudget
    before_action :set_budget
    before_action :authenticate_user!, except: [:index]
end
