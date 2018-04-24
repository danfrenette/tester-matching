Rails.application.routes.draw do
  root to: "searches#new"

  resources :searches, only: %i[new create]
end
