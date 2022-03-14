Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get "/components", to: "pages#components"
  resources :recipes, only: [:index, :show] do
    resources :bookmarks, only: [:new, :create]
  end

  resources :bookmarks, only: [:index, :destroy]
end
