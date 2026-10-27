Rails.application.routes.draw do
  namespace :admin do
    root "dashboard#index"

    resources :works, only: [ :index ]

    resources :rubrics, only: [
      :index, :new, :create, :edit, :update, :destroy
    ]
  end

  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout

  get "about", to: "pages#about", as: :about
  get "coming-soon", to: "pages#coming_soon", as: :coming_soon

  root "home#index"

  resources :subscribers, only: [ :create ]

  resources :works, only: [
    :index, :show, :new, :create, :edit, :update, :destroy
  ] do
    delete :remove_cover, on: :member

    resources :comments, only: [ :create ]

    resources :chapters, only: [
      :show, :new, :create, :edit, :update, :destroy
    ] do
      # Комментарии к главе
      resources :comments, only: [ :create ]
    end
  end

  resources :comments, only: [ :edit, :update, :destroy ]

  resources :users, only: [ :show ]
  resources :tags, only: [ :index, :show ]
  resources :fandoms, only: [ :index, :show ]

  get "up" => "rails/health#show", as: :rails_health_check
end
