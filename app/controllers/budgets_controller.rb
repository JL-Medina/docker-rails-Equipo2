class BudgetsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :invalid_budget
  before_action :set_budget, only: %i[ show edit update destroy ]

  # GET /budgets or /budgets.json
  def index
    @budgets = Budget.all
  end

  # GET /budgets/1 or /budgets/1.json
  def show
  end

  # GET /budgets/new
  def new
    @budget = Budget.new
  end

  # GET /budgets/1/edit
  def edit
  end

  # POST /budgets or /budgets.json
  def create
    @budget = Budget.new(budget_params)
    respond_to do |format|
      if @budget.save
        format.html { redirect_to budget_url(@budget), notice: t('common.create') }
        format.json { render :show, status: :created, location: @budget }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_product
    if params[:id].present?    
      @budget = Budget.find(params[:id])   
    else
      @budget = Budget.new(budget_params)
    end
    @line_item = LineItem.new()
  end

  # PATCH/PUT /budgets/1 or /budgets/1.json
  def update
    respond_to do |format|
      if @budget.update(budget_params)
        format.html { redirect_to budget_url(@budget), notice: t('common.update') }
        format.json { render :show, status: :ok, location: @budget }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @budget.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /budgets/1 or /budgets/1.json
  def destroy
    @budget.destroy if @budget.id == session[:budget_id]
    session[:budget_id] = nil

    respond_to do |format|
      format.html { redirect_to budgets_url, notice: t('common.destroy') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_budget
      @budget = Budget.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def budget_params
      params.require(:budget).permit(:user_id, :name, :expiration_date, :create_date, :quantity_products, :total_budget)
    end

    def invalid_budget
      logger.error "Attempt to access invalid budget #{params[:id]}"
      redirect_to root_path, notice: "That budget doesn't exist"
    end
end
