Rails.application.routes.draw do
  root "movies#index"
  get "signup" => "users#new"
  resources :movies do
    resources :reviews
  end
  resources :users
end
