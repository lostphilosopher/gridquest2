Rails.application.routes.draw do
  resources :scenes
  resources :players
  resources :grids
  resources :games
  resources :themes
  resources :items
  resources :npcs
  resources :populations
  resources :boxes
  devise_for :users

  get '/game/move', to: 'games#move'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
end
