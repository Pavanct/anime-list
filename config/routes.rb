Rails.application.routes.draw do
  root to: 'animes#index'

  devise_for :users, controllers: { sessions: 'users/sessions' }
  resources :animes

  resources :users, only: [:index]  do
    resources :anime_lists, only: [:index, :show, :create, :update, :destroy] do
      member do
        put :update_episodes_watched
      end
    end
  end
end
