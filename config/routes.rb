Rails.application.routes.draw do
  root 'drivers#index'
  resources :drivers

  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips, except: [:create]
end
