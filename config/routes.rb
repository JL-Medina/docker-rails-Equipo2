Rails.application.routes.draw do

  root to: 'homes#index'
  devise_for :views
  devise_for :users
  resources :budgets 
  resources :line_items
  resources :users
  resources :products
  resources :categories
  get "add_product", to: "budgets#add_product"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
