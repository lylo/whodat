Rails.application.routes.draw do
  resource :login, only: [:new, :destroy]
  get "login/create", to: "logins#create", as: :create_login

  get "/who", to: "who#play", as: :play

  root "who#index"
end
