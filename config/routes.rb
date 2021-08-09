Rails.application.routes.draw do
  root to: "items#index"
  resources :items, only: [:new, :create, :edit, :update, :show]
  devise_for :users
end
