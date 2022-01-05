Rails.application.routes.draw do
  resources :games do
    resources :reviews
  end

  resource :users, only: [:create]
  post "/login", to: "users#login"
  get "/auto_login", to: "users#auto_login"

  get "/allgames", to: "games#allgames"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
