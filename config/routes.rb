Rails.application.routes.draw do
  root to: "items#index"
  devise_for :users
  resources :items, only: [:new, :create, :show, :edit, :update, :destroy] do
    collection do
      get 'search'
    end
    resources :purchases, only: [:index, :create]
  end
end
