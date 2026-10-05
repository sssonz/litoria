Rails.application.routes.draw do
  root "home#index"

  resources :works, only: [ :index, :show ] do
    resources :chapters, only: [ :show ]
  end

  resources :users, only: [ :show ]
  resources :tags, only: [ :index, :show ]
  resources :fandoms, only: [ :index, :show ]

  get "up" => "rails/health#show", as: :rails_health_check
end
