Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get "/messages" => "messages#index"
      post "/messages" => "messages#create"
    end
  end

  get "/messages" => "messages#index"
  post "/messages" => "messages#create"

  get "/signup" => "users#new"
  post "/users" => "users#create"
  get "/login" => "sessions#new"
  post "/login" => "sessions#create"
  get "/logout" => "sessions#destroy"
end
