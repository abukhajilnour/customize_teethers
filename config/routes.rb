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
  get "/terms" => "home#terms"
  get "/reviews" => "home#reviews"
  get "/testamonials" => "home#testamonials"
end
