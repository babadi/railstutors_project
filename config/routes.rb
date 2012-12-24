CourseProject::Application.routes.draw do
  root to: "posts#index"
  resources :posts do
  	resources :comments, only: :create
  	resources :votes, only: :create
  end
end
