Rails.application.routes.draw do
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/user_books" => "user_books#index"
  post "/user_books" => "user_books#create"
  patch "/user_books/:id" => "user_books#update"
  delete "/user_books/:id" => "user_books#destroy"
  
  get "/books" => "books#index"
  get "/books/:id" => "books#show"

end
