json.extract! budget, :id, :user_id, :name, :expiration_date, :create_date, :quantity_products, :total_budget, :created_at, :updated_at
json.url budget_url(budget, format: :json)
