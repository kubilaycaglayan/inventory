Rails.application.routes.draw do
  resources :products
  root 'pages#index'

  get '*path', to: 'pages#index', via: :all
end
