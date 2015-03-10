Rails.application.routes.draw do
  
  get 'static_pages/index'

  root to: "static_pages#index"

  devise_for :admins
  devise_for :users

end
