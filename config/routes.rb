Rails.application.routes.draw do
  get 'oauths/oauth'
  get 'oauths/callback'
  get 'admin_panel/index'
  root 'courses#index'

  resources :courses
  resources :users
  resources :sessions
  resources :admin_panel

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback" # for use with Github, Facebook
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
end
