Rails.application.routes.draw do
  root 'home#index'

  resources :archives, only: [:new, :create, :show]
end
