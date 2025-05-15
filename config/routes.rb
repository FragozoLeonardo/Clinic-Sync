Rails.application.routes.draw do
  resources :patient_profiles
  get "/admin/home", to: "admins#home", as: "admins_home"
  get "/doctors/home", to: "doctors#home", as: "doctors_home"
  get "/secretaries/home", to: "secretaries#home", as: "secretaries_home"
  get "/patients/home", to: "patients#home", as: "patients_home"

  resource :session
  resources :passwords, param: :token
  root "sessions#new"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"
end
