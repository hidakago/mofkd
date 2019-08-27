Rails.application.routes.draw do
  root to: 'rentals#index'
  resources :rentals, only: [:index, :new, :create, :show, :edit, :update]
end
