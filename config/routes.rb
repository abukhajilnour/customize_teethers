Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  resources :home
  resources :teethers
  resources :colors
  resources :types
  resources :contacts
  resources :newsletters

  get "/baby" => "home#baby"
  get "/reviews" => "home#reviews"
end
