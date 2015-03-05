Rails.application.routes.draw do
	resources :users
	get 'register', to: "users#new"
  root to: "users#index"
end
