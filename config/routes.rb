Rails.application.routes.draw do
  root 'courses#index', as: 'home'
  resources :courses
end
