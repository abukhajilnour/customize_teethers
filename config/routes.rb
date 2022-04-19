Rails.application.routes.draw do

  get 'checkout/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root 'home#index'
  resources :home
  resources :teethers
  resources :colors
  resources :types
  resources :contacts
  resources :newsletters
  post "shippings/create" => "shippings#create", :as => "create"
  
  resources :shippings

  resources :checkout,only:[:index]
  post "teethers/add_to_cart/:id" => "teethers#add_to_cart", :as => "add_to_cart"
  delete "teethers/remove_from_cart/:id", to: "teethers#remove_from_cart", as: "remove_from_cart"
  get "success", to: "shippings#success"
  get "cancel", to: "shippings#cancel"
  post "teethers/get_engraving" => "teethers#get_engraving", :as => "get_engraving"







  resources :order_items
  resource :cards,only:[:show]
  get 'cards/show'
  delete "cards/remove_from_card/:id", to: "cards#remove_from_card", as: "remove_from_card"


  get "/baby" => "home#baby"
  get "/terms" => "home#terms"
  get "/reviews" => "home#reviews"
  get "/testamonials" => "home#testamonials"
end
