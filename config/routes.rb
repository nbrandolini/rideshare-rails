Rails.application.routes.draw do
  root 'drivers#index'
  resources :drivers

  resources :passengers do
    resources :trips, only: [:create]
  end

  resources :trips, except: [:create]
  patch '/trips/:id/update_rating', to: 'trips#update_rating', as: 'submit_rating'
end
