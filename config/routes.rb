Rails.application.routes.draw do
  root "home#show"
  namespace :api do
    resources :flights, only: [:index]
  end
end
