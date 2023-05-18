Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"

  get "/users", to: "users#index", as: "users"
  get "/users/:id", to: "users#show", as: "user"
  
  get "/users/:id/posts", to: "posts#index", as: "user_posts"
  get "/posts/new", to: "posts#new", as: "user_posts_new"
  post "/posts", to: "posts#create", as: "user_posts_create"
  delete "/posts/:id", to: "posts#destroy", as: "delete_post"
  get "/posts/:id/new", to: "comments#new", as: "user_post_comments_new"
  post "/posts/:id", to: "comments#create", as: "user_post_comments_create"
  delete "/posts/:id/comments/:id", to: "comments#destroy", as: "delete_comment"
  post "/posts/:id/like", to: "likes#create", as: "user_post_likes"
  get "/posts/:id", to: "posts#show", as: "user_post"
  
end
