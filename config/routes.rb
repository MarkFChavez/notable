Rails.application.routes.draw do
  root "sessions#new"

  get "/signin" => "sessions#new"
  post "/signin" => "sessions#create"

  resource :dashboard, only: [:show]
end
