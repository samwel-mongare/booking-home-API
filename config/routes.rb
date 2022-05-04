Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"

  namespace :api do
    namespace :v1 do  
      resources :apartments, only: %i[index show create update destroy]
      resources :rentals, only: %i[index create destroy]
      resources :markets, only: %i[index create destroy]
      resources :user_apartments, only: %i[index create destroy]
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
end
