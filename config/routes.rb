Rails.application.routes.draw do
  root 'courses#index', as: 'home'
  resources :courses
  get 'join', to: 'joins#join_to_course', as: 'join'
end
