CourseProject::Application.routes.draw do
  root to: "posts#index"
  
  resources :posts do
  	resources :comments, only: :create
  	resources :votes, only: :create
  end

  resources :users, only: :create
  get 'register', to: 'users#new', as: 'register'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
