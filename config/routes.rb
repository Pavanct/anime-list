Rails.application.routes.draw do
  resources :animes

  resources :users do
    resources :anime_lists, only: [:index, :create]
  end
end
