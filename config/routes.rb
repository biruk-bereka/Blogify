Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"

  get "/users", to: "users#index", as: "users"
  get "/users/:id", to: "users#show", as: "user"
  
  get "/users/:id/posts", to: "posts#index", as: "user_posts"
  get "/posts/new", to: "posts#new", as: "user_posts_new"
  post "/posts", to: "posts#create", as: "user_posts_create"
  get "/posts/:id/new", to: "comments#new", as: "user_post_comments_new"
  post "/posts/:id", to: "comments#create", as: "user_post_comments_create"
  post "/posts/:id/like", to: "likes#create", as: "user_post_likes"
  get "/posts/:id", to: "posts#show", as: "user_post"
  
end
