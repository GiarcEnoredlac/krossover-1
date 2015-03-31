Rails.application.routes.draw do

  resources :reviews, only: [:new, :create]

  devise_for :users, controllers: { registrations: "users/registrations", sessions: "users/sessions" }

  devise_scope :user do
    get  '/dashboard', to: 'dashboards#index'
    get  '/register', to: 'users/registrations#new', as: :register
    get  '/profile/edit', to: 'users/registrations#edit', as: :edit

    get  '/login', to: 'users/sessions#new', as: :login   
    get  '/logout', to: 'users/sessions#destroy', as: :logout

    root to: "users/sessions#new"
  end  

  devise_for :admins, controllers: { registrations: "admins/registrations", sessions: "admins/sessions" }

  devise_scope :admin do
    get  'admins/register', to: 'admins/registrations#new', as: :admin_register
    get  'admins/dashboard/profile/edit', to: 'admins/registrations#edit', as: :admin_edit

    get  'admins/login', to: 'admins/sessions#new', as: :admin_login   
    get  'admins/logout', to: 'admins/sessions#destroy', as: :admin_logout
  end  

  # Indexer profile url
  get 'u', to: 'profiles#index', as: 'profile_index'
  get 'u/:id', to: 'profiles#show', as: 'profile'

  # Leaderboards url
  get 'leaderboards', to: 'leaderboards#index'

  get 'inbox', to: 'conversations#index'
  resources :conversations do 
    resources :messages
  end

end
