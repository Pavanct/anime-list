Rails.application.routes.draw do
  get 'users/index'
  get 'users/new'
  get 'users/create'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'animes/index'
  get 'animes/new'
  get 'animes/create'
  get 'animes/edit'
  get 'animes/update'
  get 'animes/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
