Rails.application.routes.draw do
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/id" => "users#destroy"

  post "/sessions" => "sessions#create"

  get "/user_books" => "user_books#index"

end
