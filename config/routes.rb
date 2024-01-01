Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :articles
  end
end
