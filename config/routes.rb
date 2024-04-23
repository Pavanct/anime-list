Rails.application.routes.draw do
  root to: 'animes#index'

  devise_for :users
  resources :animes

  resources :users do
    resources :anime_lists, only: [:index, :show, :create, :update, :destroy]
  end
end
