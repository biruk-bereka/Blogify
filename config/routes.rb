Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "users#index"

  get "/users", to: "users#index", as: "users"
  get "/users/:id", to: "users#show", as: "user"
  
  get "/users/:id/posts", to: "posts#index", as: "user_posts"
  get "/users/:id/posts/new", to: "posts#new", as: "user_posts_new"
  get "/users/:id/posts/:id", to: "posts#show", as: "user_post"


  post "/users/:id/posts", to: "posts#create", as: "user_posts_create"

end
