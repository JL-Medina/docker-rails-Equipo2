require 'test_helper'

class BudgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @budget = budgets(:one)
  end

  test "should get index" do
    get budgets_url
    assert_response :success
  end

  test "should get new" do
    get new_budget_url
    assert_response :success
  end

  test "should create budget" do
    assert_difference('Budget.count') do
      post budgets_url, params: { budget: { create_date: @budget.create_date, expiration_date: @budget.expiration_date, name: @budget.name, quantity_products: @budget.quantity_products, total_budget: @budget.total_budget, user_id: @budget.user_id } }
    end

    assert_redirected_to budget_url(Budget.last)
  end

  test "should show budget" do
    get budget_url(@budget)
    assert_response :success
  end

  test "should get edit" do
    get edit_budget_url(@budget)
    assert_response :success
  end

  test "should update budget" do
    patch budget_url(@budget), params: { budget: { create_date: @budget.create_date, expiration_date: @budget.expiration_date, name: @budget.name, quantity_products: @budget.quantity_products, total_budget: @budget.total_budget, user_id: @budget.user_id } }
    assert_redirected_to budget_url(@budget)
  end

  test "should destroy budget" do
    assert_difference('Budget.count', -1) do
      delete budget_url(@budget)
    end

    assert_redirected_to budgets_url
  end
end
