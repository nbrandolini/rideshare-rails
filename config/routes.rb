Rails.application.routes.draw do
  root 'drivers#index'
  resources :drivers

  resources :passengers

  resources :trips, except: [:create]
end
