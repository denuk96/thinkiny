Rails.application.routes.draw do
  root 'courses#index'

  get 'join', to: 'joins#join_to_course', as: 'join'

  resources :courses do
    get 'remove_picture_at_index', on: :collection
    get 'change_role', on: :collection
    get 'set_user_confirmation', on: :collection
    get 'change_course_status', on: :collection
    get 'nearbys', on: :collection
    resources :pictures, only: [:create, :destroy]
    resources :lessons do
      resources :check_ins do
        get 'user_attendance', on: :collection
      end
    end
  end

  resources :users do
    member do
      get :activate
    end
  end
  resources :sessions, :categories
  resources :reset_passwords, only: %i[new create update edit]

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'users#new',        as: 'signup'

end
