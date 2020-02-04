Rails.application.routes.draw do
  get 'admin_panel/index'
  root 'courses#index'

  resources :courses
  get 'join', to: 'joins#join_to_course', as: 'join'
  resources :users
  resources :sessions
  resources :admin_panel

  get "logout" => "sessions#destroy", :as => "logout"
  get "login" => "sessions#new", :as => "login"
  get "signup" => "users#new", :as => "signup"
end
