module CurrentBudget


private

def set_budget
    @budget = Budget.find(session[:budget_id])
rescue ActiveRecord::RecordNotFound
    @budget = Budget.create
    session[:budget_id] = @budget.id
end
end 