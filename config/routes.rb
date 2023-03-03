Rails.application.routes.draw do
  get 'rooms/show/:id', to: 'rooms#show', as: 'room'
  post 'rooms/add_user/:id', to: 'rooms#add_user', as: 'add_user'
  root 'pages#index'
  get 'pages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
