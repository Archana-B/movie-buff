Rails.application.routes.draw do
  resources :genres
  root "movies#index"
  get "signup" => "users#new"
  get "signin" => "sessions#new"
  get "signout" => "sessions#destroy"
  get "movies/filter/:filter" => "movies#index", as: :movies_filter
  resources :movies do
    resources :reviews
    resources :favorites    
  end
  resources :users
  resource :session
end
