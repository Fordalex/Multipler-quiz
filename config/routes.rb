Rails.application.routes.draw do
  root 'home#home'

  get 'players/new/:room_id', to: 'players#new', as: 'new'
  resources :players, only: [:create]

  resources :rooms, except: [:index] do
    get 'lobby'
    get 'show_main'
    get 'show_player'
  end

  # get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
