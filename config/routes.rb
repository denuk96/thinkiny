require 'sidekiq/web'
Sidekiq::Web.set :sessions, false

Rails.application.routes.draw do
  Sidekiq::Web.use Rack::Auth::Basic do |username, password|
    username == 'user' && password == 'password'
  end
  mount Sidekiq::Web => '/sidekiq', as: 'background'

  root 'pages#welcome'
  get '/pages/:page' => 'pages#show'
  get 'notifications/viewed'
  get 'join', to: 'joins#join_to_course', as: 'join'
  get 'viewed_notification', to: 'notifications#viewed_notification', as: 'viewed_notification'

  resources :courses do
    get 'remove_picture_at_index', on: :collection
    get 'change_role', on: :collection
    get 'set_user_confirmation', on: :collection
    get 'change_course_status', on: :collection
    get 'nearbys', on: :collection
    resources :pictures, only: %i[create destroy]
    resources :lessons do
      resources :tasks, only: %i[new create change_status destroy] do
        get 'change_status'
      end
      resources :check_ins do
        get 'user_attendance', on: :collection
      end
    end
    get 'rating_form', to: 'ratings#edit', as: 'rating_form'
    patch 'save_rating', to: 'ratings#update', as: 'save_rating'
  end

  resources :users do
    member do
      get :activate
      get :viewed_notification
    end
  end
  resources :sessions, :categories
  resources :reset_passwords, only: %i[new create update edit]

  post 'oauth/callback' => 'oauths#callback'
  get 'oauth/callback' => 'oauths#callback'
  get 'oauth/:provider' => 'oauths#oauth', :as => :auth_at_provider
  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'users#new',        as: 'signup'
end
