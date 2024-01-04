Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :articles
    post "/users/login", to: "users#login"
  end
end
