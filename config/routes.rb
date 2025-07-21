Rails.application.routes.draw do
  # Public API Routes
  namespace :api do
    namespace :v1 do
      get "portfolio", to: "portfolio#index"
      get "homepage_section", to: "homepage_sections#show"
      get "skills", to: "skills#index"
      get "projects", to: "projects#index"
      get "projects/:id", to: "projects#show"
      get "contact", to: "contacts#show"
    end
  end

  resource :session, except: %i[ new ]
  get "login", to: "sessions#new", as: :new_session

  # Route for editing password only
  resources :passwords, param: :token, only: %i[ edit update ]

  # CMS Routes (protected by auth)
  resources :homepage_sections, only: %i[ show edit update ]
  resources :skills
  resources :contacts, only: %i[ show edit update ] do
    resources :socials, except: %i[ show ]
  end
  resources :projects do
    member do
      delete :remove_gallery_image
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "pages#index"
  get "/dashboard", to: "pages#dashboard"
end
