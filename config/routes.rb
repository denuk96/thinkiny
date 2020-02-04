Rails.application.routes.draw do
  root 'courses#index'

  resources :check_ins
  get 'start_lesson', to: 'check_ins#check_in', as: 'start_lesson'

  resources :courses do
    resources :lessons
  end
  
  get 'join', to: 'joins#join_to_course', as: 'join'
  resources :users
  resources :sessions

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
