Rails.application.routes.draw do

  devise_for :views
  devise_for :users
  resources :budgets
  resources :homes
  resources :line_items
  resources :users
  resources :products
  resources :categories
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
