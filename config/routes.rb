Rails.application.routes.draw do
  resources :invoices
  resources :sales
  resources :products
  root 'pages#index'

  get '*path', to: 'pages#index', via: :all
end
