Rails.application.routes.draw do
  resources :animes

  resources :users do
    resources :user_animes, only: [:index, :show, :create, :update, :destroy]
  end
end
