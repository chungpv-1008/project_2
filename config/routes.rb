Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#index"
    devise_for :users, controllers: {sessions: "users/sessions",
      registrations: "users/registrations"}
    devise_scope :user do
      get "/signup", to: "users/registrations#new"
      post "/signup", to: "users/registrations#create"
      get "/login", to: "users/sessions#new"
      post "/login", to: "users/sessions#create"
      get "/logout", to: "users/sessions#destroy"
    end
    resources :users
  end
end
