Rails.application.routes.draw do
	resources :users
	get 'login', to: "users#new"
  root to: "users#index"
end
