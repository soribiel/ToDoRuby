Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  root 'lists#index'
  resources :lists, only: [:create, :update, :destroy] do
    member do
      post :add_item
      patch :toggle_item
      delete :destroy_item
      patch :sort_items_by_priority
    end
  end
end