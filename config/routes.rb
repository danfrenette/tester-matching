Rails.application.routes.draw do
  root to: "searches#new"
  get "/searches", to: redirect("/")

  resources :searches, only: %i[new create]
end
