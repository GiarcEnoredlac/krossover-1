Rails.application.routes.draw do
  
  resources :video_reviews

  get 'static_pages/index'

  root to: "static_pages#index"

  get 'register', to: "users#new"
  get 'login', to: "sessions#new"
  get 'logout', to: "sessions#destroy"
  resources :users, only: [:create]
  resources :sessions, only: [:create]

  get  '/profile/edit', to: 'users#edit', as: :edit

  # devise_for :admins, controllers: { registrations: "admins/registrations", sessions: "admins/sessions" }

  # devise_scope :admin do
  #   get  'admins/register', to: 'admins/registrations#new', as: :admin_register
  #   get  'admins/dashboard/profile/edit', to: 'admins/registrations#edit', as: :admin_edit

  #   get  'admins/login', to: 'admins/sessions#new', as: :admin_login   
  #   get  'admins/logout', to: 'admins/sessions#destroy', as: :admin_logout
  # end  

  # Indexer profile url
  get 'u', to: 'profiles#index', as: 'profile_index'
  get 'u/:id', to: 'profiles#show', as: 'profile'

  # Leaderboards url
  get 'leaderboards', to: 'leaderboards#index'

end
