Rails.application.routes.draw do
  root "movies#index"
  get "signup" => "users#new"
  get "signin" => "sessions#new"
  get "signout" => "sessions#destroy"
  resources :movies do
    resources :reviews
  end
  resources :users
  resource :session
end
