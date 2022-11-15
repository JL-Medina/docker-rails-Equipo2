Rails.application.routes.draw do
<<<<<<< HEAD
  resources :categories
=======

  devise_for :users
  resources :budgets
  resources :homes
  resources :line_items
  resources :users
  resources :products
  resources :categories
  
>>>>>>> 3f0eb6442aecb6a76ddd68260e0784a3df9b0c3c
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
