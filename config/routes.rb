Rails.application.routes.draw do
  root 'courses#index'

  get 'join', to: 'joins#join_to_course', as: 'join'

  resources :courses do
    get 'change_role', on: :collection
    get 'set_user_confirmation', on: :collection
    resources :lessons do
      resources :check_ins do
        get 'user_attendance', on: :collection
      end
    end
  end

  resources :users
  resources :sessions

  post "oauth/callback" => "oauths#callback"
  get "oauth/callback" => "oauths#callback"
  get "oauth/:provider" => "oauths#oauth", :as => :auth_at_provider
  get 'login',  to: 'sessions#new',     as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'signup', to: 'users#new',        as: 'signup'

end
