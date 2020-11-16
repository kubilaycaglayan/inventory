Rails.application.routes.draw do
  root 'pages#index'

  namespace :api, :defaults => {:format => :json} do
    resources :invoices, only: [:create]
  end

  get '*path', to: 'pages#index', via: :all
end
