Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :articles
    # post "/users/login", to: "users#login"
    post   "/login",   to: "sessions#create"
    delete "/logout",  to: "sessions#destroy"
    raise
  end
end
